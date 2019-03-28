import Dispatch

// These are protocols that define DispatchQueue-based wrappers for functions that are found on multiple
// entities. By putting the wrappers in a separate mixin protocol, they can be added to the objects
// without duplication.
//
// Ideally, we would just add the mixin to protocols such as Thenable. However, Swift (as of v5)
// does not allow protocol extension that add conformance to other protocols. The underlying issue is the risk
// of overlapping conformances. See https://goo.gl/rViwWS. The workaround is to declare conformance on each
// underlying object separately.
//
// Associated types within protocols may not be generic, so there are many functions that can't be genericized
// in this way. For example, anything of the form `func foo<U>(_ body: () -> U) -> Promise<U>` is unrepresentable.

public protocol PMKSharedWrappers {
    
    associatedtype T
    associatedtype BaseOfT
    associatedtype BaseOfVoid
    associatedtype VoidReturn

    func done(on: Dispatcher, _ body: @escaping(T) throws -> Void) -> BaseOfVoid
    func get(on: Dispatcher, _ body: @escaping(T) throws -> Void) -> BaseOfT
    func tap(on: Dispatcher, _ body: @escaping(Result<T, Error>) -> Void) -> BaseOfT

    func recover<U: Thenable>(on: Dispatcher, policy: CatchPolicy, _ body: @escaping(Error) throws -> U) -> BaseOfT where U.T == T
    func recover<U: Thenable, E: Swift.Error>(_ only: E, on: Dispatcher, _ body: @escaping() throws -> U) -> BaseOfT where U.T == T, E: Equatable
    func recover<U: Thenable, E: Swift.Error>(_ only: E.Type, on: Dispatcher, policy: CatchPolicy, _ body: @escaping(E) throws -> U) -> BaseOfT where U.T == T

    func ensure(on: Dispatcher, _ body: @escaping () -> Void) -> BaseOfT
    func ensureThen(on: Dispatcher, _ body: @escaping () -> VoidReturn) -> BaseOfT
}

public protocol PMKSharedVoidWrappers {
    
    associatedtype BaseOfVoid
    
    func recover(on: Dispatcher, policy: CatchPolicy, _ body: @escaping(Error) throws -> Void) -> BaseOfVoid
    func recover<E: Swift.Error>(_ only: E, on: Dispatcher, _ body: @escaping() -> Void) -> BaseOfVoid where E: Equatable
    func recover<E: Swift.Error>(_ only: E.Type, on: Dispatcher, policy: CatchPolicy, _ body: @escaping(E) throws -> Void) -> BaseOfVoid
}

public protocol PMKFinallyWrappers {
    
    associatedtype FinallyReturn
    
    func finally(on: Dispatcher, _ body: @escaping () -> Void) -> FinallyReturn
}

public protocol PMKCatchWrappers {
    
    associatedtype Finalizer
    associatedtype CascadingFinalizer
    
    func `catch`(on: Dispatcher, policy: CatchPolicy, _ body: @escaping(Error) -> Void) -> Finalizer
    func `catch`<E: Swift.Error>(_ only: E, on: Dispatcher, _ body: @escaping() -> Void) -> CascadingFinalizer where E: Equatable
    func `catch`<E: Swift.Error>(_ only: E.Type, on: Dispatcher, policy: CatchPolicy, _ body: @escaping(E) -> Void) -> CascadingFinalizer
}

extension Promise: PMKSharedWrappers {
    public typealias T = T
    public typealias BaseOfT = Promise<T>
    public typealias BaseOfVoid = Promise<Void>
}

extension CancellablePromise: PMKSharedWrappers {
    public typealias T = T
    public typealias BaseOfT = CancellablePromise<T>
    public typealias BaseOfVoid = CancellablePromise<Void>
}

extension Promise: PMKSharedVoidWrappers where T == Void {}
extension CancellablePromise: PMKSharedVoidWrappers where C.T == Void {}

extension PMKFinalizer: PMKFinallyWrappers {}
extension CancellableFinalizer: PMKFinallyWrappers {}

extension Promise: PMKCatchWrappers {}
extension PMKCascadingFinalizer: PMKCatchWrappers {}
extension CancellablePromise: PMKCatchWrappers {}
extension CancellableCascadingFinalizer: PMKCatchWrappers {}

