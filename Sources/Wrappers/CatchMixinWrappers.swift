import Dispatch

public protocol RecoverWrappers {
    
    associatedtype BaseOfT
    associatedtype BaseOfVoid
    associatedtype T
    
    // Base methods
    func recover<U: Thenable>(on: Dispatcher, policy: CatchPolicy, _ body: @escaping(Error) throws -> U) -> BaseOfT where U.T == T
    func recover<U: Thenable, E: Swift.Error>(_ only: E, on: Dispatcher, _ body: @escaping() -> U) -> BaseOfT where U.T == T, E: Equatable
    func recover<U: Thenable, E: Swift.Error>(_ only: E.Type, on: Dispatcher, policy: CatchPolicy, _ body: @escaping(E) throws -> U) -> BaseOfT where U.T == T
    func recover(on: Dispatcher, _ body: @escaping(Error) -> Guarantee<T>) -> Guarantee<T>
    
    // Methods for T == Void
    func recover(on: Dispatcher, _ body: @escaping(Error) -> Void) -> Guarantee<Void>
    func recover(on: Dispatcher, policy: CatchPolicy, _ body: @escaping(Error) throws -> Void) -> BaseOfVoid
    func recover<E: Swift.Error>(_ only: E, on: Dispatcher, _ body: @escaping() -> Void) -> BaseOfVoid where E: Equatable
    func recover<E: Swift.Error>(_ only: E.Type, on: Dispatcher, policy: CatchPolicy, _ body: @escaping(E) throws -> Void) -> BaseOfVoid
    
}

extension Promise: RecoverWrappers {
    public typealias BaseOfT = Promise<T>
    // typealias T = T
}

public extension RecoverWrappers {
    
    /**
     The provided closure executes when this promise rejects.
     
     Unlike `catch`, `recover` continues the chain. It can return a replacement promise or rethrow.
     Use `recover` in circumstances where recovering the chain from certain errors is a possibility. For example:
     
         firstly {
            CLLocationManager.requestLocation()
         }.recover { error in
            guard error == CLError.unknownLocation else { throw error }
            return .value(CLLocation.chicago)
         }
     
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter flags: `DispatchWorkItemFlags` to be applied when dispatching.
     - Parameter policy: The default policy does not execute your handler for cancellation errors.
     - Parameter body: The handler to execute if this promise is rejected.
     - SeeAlso: [Cancellation](https://github.com/mxcl/PromiseKit/blob/master/Documents/CommonPatterns.md#cancellation)
     */
    func recover<U: Thenable>(on: DispatchQueue? = .pmkDefault, flags: DispatchWorkItemFlags? = nil, policy: CatchPolicy = conf.catchPolicy,
        _ body: @escaping(Error) throws -> U) -> BaseOfT where U.T == T
    {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(on: dispatcher, policy: policy, body)
    }

    /**
     The provided closure executes when this promise rejects with the specific error passed in.
     
     Unlike `catch`, `recover` continues the chain. It can return a replacement promise or rethrow.
     Use `recover` in circumstances where recovering the chain from certain errors is a possibility. For example:
     
         firstly {
            CLLocationManager.requestLocation()
         }.recover(CLError.unknownLocation) {
            return .value(CLLocation.chicago)
         }
     
     - Parameter only: The specific error to be recovered (e.g., `PMKError.emptySequence`)
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter flags: `DispatchWorkItemFlags` to be applied when dispatching.
     - Parameter body: The handler to execute if this promise is rejected with the provided error.
     - Note: Since this method recovers only specific errors, supplying a `CatchPolicy` is unsupported.
     - SeeAlso: [Cancellation](http://promisekit.org/docs/)
     */
    func recover<U: Thenable, E: Swift.Error>(_ only: E, on: DispatchQueue? = .pmkDefault, flags: DispatchWorkItemFlags? = nil,
        _ body: @escaping() -> U) -> BaseOfT where U.T == T, E: Equatable
    {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(only, on: dispatcher, body)
    }

    /**
     The provided closure executes when this promise rejects with an error of the type passed in.
     
     Unlike `catch`, `recover` continues the chain. It can return a replacement promise or rethrow.
     Use `recover` in circumstances where recovering the chain from certain errors is a possibility. For example:
     
         firstly {
            API.fetchData()
         }.recover(FetchError.self) { error in
            guard case .missingImage(let partialData) = error else { throw error }
            //…
            return .value(dataWithDefaultImage)
         }
     
     - Parameter only: The error type to be recovered (e.g., `PMKError`).
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter flags: `DispatchWorkItemFlags` to be applied when dispatching.
     - Parameter policy: The default policy does not execute your handler for cancellation errors.
     - Parameter body: The handler to execute if this promise is rejected with the provided error type.
     - SeeAlso: [Cancellation](http://promisekit.org/docs/)
     */
    func recover<U: Thenable, E: Swift.Error>(_ only: E.Type, on: DispatchQueue? = .pmkDefault, flags: DispatchWorkItemFlags? = nil,
        policy: CatchPolicy = conf.catchPolicy, _ body: @escaping(E) throws -> U) -> BaseOfT where U.T == T
    {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(only, on: dispatcher, policy: policy, body)
    }
    
    /**
     The provided closure executes when this promise rejects.
     This variant of `recover` requires the handler to return a Guarantee; your closure cannot `throw`.
     
     It is logically impossible for this variant to accept a `catchPolicy`. All errors will be presented
     to your closure for processing.
     
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter flags: `DispatchWorkItemFlags` to be applied when dispatching.
     - Parameter body: The handler to execute if this promise is rejected.
     - SeeAlso: [Cancellation](https://github.com/mxcl/PromiseKit/blob/master/Documents/CommonPatterns.md#cancellation)
     */
    @discardableResult
    func recover(on: DispatchQueue? = .pmkDefault, flags: DispatchWorkItemFlags? = nil, _ body: @escaping(Error) -> Guarantee<T>) -> Guarantee<T> {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(on: dispatcher, body)
    }

}

public extension CatchMixin where T == Void {

    /**
     The provided closure executes when this promise rejects.
     
     This variant of `recover` is specialized for `Void` promises and de-errors your chain,
     returning a `Guarantee`. Thus, you cannot `throw` and you must handle all error types,
     including cancellation.
     
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter flags: `DispatchWorkItemFlags` to be applied when dispatching.
     - Parameter body: The handler to execute if this promise is rejected.
     - SeeAlso: [Cancellation](https://github.com/mxcl/PromiseKit/blob/master/Documents/CommonPatterns.md#cancellation)
     */
    @discardableResult
    func recover(on: DispatchQueue? = .pmkDefault, flags: DispatchWorkItemFlags? = nil, _ body: @escaping(Error) -> Void) -> Guarantee<Void> {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(on: dispatcher, body)
    }

    /**
     The provided closure executes when this promise rejects.
     
     This variant of `recover` ensures that no error is thrown from the handler
     and allows you to specify a catch policy.
     
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter flags: `DispatchWorkItemFlags` to be applied when dispatching.
     - Parameter policy: The default policy does not execute your handler for cancellation errors.
     - Parameter body: The handler to execute if this promise is rejected.
     - SeeAlso: [Cancellation](https://github.com/mxcl/PromiseKit/blob/master/Documents/CommonPatterns.md#cancellation)
     */
    func recover(on: DispatchQueue? = .pmkDefault, flags: DispatchWorkItemFlags? = nil, policy: CatchPolicy = conf.catchPolicy,
        _ body: @escaping(Error) throws -> Void) -> Promise<Void>
    {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(on: dispatcher, policy: policy, body)
    }
    
    /**
     The provided closure executes when this promise rejects with the specific error passed in.
     
     Unlike `catch`, `recover` continues the chain. It can return a replacement promise or rethrow.
     Use `recover` in circumstances where recovering the chain from certain errors is a possibility. For example:
     
     - Parameter only: The specific error to be recovered (e.g., `PMKError.emptySequence`)
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter flags: `DispatchWorkItemFlags` to be applied when dispatching.
     - Parameter body: The handler to execute if this promise is rejected with the provided error.
     - Note: Since this method recovers only specific errors, supplying a `CatchPolicy` is unsupported.
     - SeeAlso: [Cancellation](http://promisekit.org/docs/)
     */
    func recover<E: Swift.Error>(_ only: E, on: DispatchQueue? = .pmkDefault, flags: DispatchWorkItemFlags? = nil,
        _ body: @escaping() -> Void) -> Promise<Void> where E: Equatable
    {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(only, on: dispatcher, body)
    }

    /**
     The provided closure executes when this promise rejects with an error of the type passed in.
     
     Unlike `catch`, `recover` continues the chain. It can return a replacement promise or rethrow.
     Use `recover` in circumstances where recovering the chain from certain errors is a possibility.
     
     - Parameter only: The error type to be recovered (e.g., `PMKError`).
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter flags: `DispatchWorkItemFlags` to be applied when dispatching.
     - Parameter policy: The default policy does not execute your handler for cancellation errors.
     - Parameter body: The handler to execute if this promise is rejected with the provided error type.
     - SeeAlso: [Cancellation](http://promisekit.org/docs/)
     */
    func recover<E: Swift.Error>(_ only: E.Type, on: DispatchQueue? = .pmkDefault, flags: DispatchWorkItemFlags? = nil,
        policy: CatchPolicy = conf.catchPolicy, _ body: @escaping(E) throws -> Void) -> Promise<Void>
    {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(only, on: dispatcher, body)
    }

}
