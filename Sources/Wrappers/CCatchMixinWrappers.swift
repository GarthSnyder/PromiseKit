import Dispatch

public extension CancellableCatchMixin {
    
    /**
     The provided closure executes when this cancellable promise rejects.
     
     Unlike `catch`, `recover` continues the chain.
     Use `recover` in circumstances where recovering the chain from certain errors is a possibility. For example:
     
     let context = firstly {
     CLLocationManager.requestLocation()
     }.recover { error in
     guard error == CLError.unknownLocation else { throw error }
     return .value(CLLocation.chicago)
     }.cancelContext
     
     //…
     
     context.cancel()
     
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter policy: The default policy does not execute your handler for cancellation errors.
     - Parameter body: The handler to execute if this promise is rejected.
     - SeeAlso: [Cancellation](https://github.com/mxcl/PromiseKit/blob/master/Documentation/CommonPatterns.md#cancellation)
     */
    func recover<V: CancellableThenable>(on: DispatchQueue? = conf.Q.map, flags: DispatchWorkItemFlags? = nil, policy: CatchPolicy = conf.catchPolicy, _ body: @escaping(Error) throws -> V) -> CancellablePromise<C.T> where V.U.T == C.T {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(on: dispatcher, policy: policy, body)
    }
    
    /**
     The provided closure executes when this cancellable promise rejects.
     
     Unlike `catch`, `recover` continues the chain.
     Use `recover` in circumstances where recovering the chain from certain errors is a possibility. For example:
     
     let context = firstly {
     CLLocationManager.requestLocation()
     }.cancellize().recover { error in
     guard error == CLError.unknownLocation else { throw error }
     return .value(CLLocation.chicago)
     }.cancelContext
     
     //…
     
     context.cancel()
     
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter policy: The default policy does not execute your handler for cancellation errors.
     - Parameter body: The handler to execute if this promise is rejected.
     - SeeAlso: [Cancellation](https://github.com/mxcl/PromiseKit/blob/master/Documentation/CommonPatterns.md#cancellation)
     */
    func recover<V: Thenable>(on: DispatchQueue? = conf.Q.map, flags: DispatchWorkItemFlags? = nil, policy: CatchPolicy = conf.catchPolicy, _ body: @escaping(Error) throws -> V) -> CancellablePromise<C.T> where V.T == C.T {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(on: dispatcher, body)
    }
    
    /**
     The provided closure executes when this cancellable promise rejects with the specific error passed in.
     
     Unlike `catch`, `recover` continues the chain.
     Use `recover` in circumstances where recovering the chain from certain errors is a possibility. For example:
     
     firstly {
     CLLocationManager.requestLocation()
     }.recover(CLError.unknownLocation) {
     return .value(CLLocation.chicago)
     }
     
     - Parameter only: The specific error to be recovered.
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter body: The handler to execute if this promise is rejected with the provided error.
     - Note: Since this method recovers only specific errors, supplying a `CatchPolicy` is unsupported. You can instead specify e.g. your cancellable error.
     - SeeAlso: [Cancellation](https://github.com/mxcl/PromiseKit/blob/master/Documentation/CommonPatterns.md#cancellation)
     */
    func recover<V: CancellableThenable, E: Swift.Error>(_ only: E, on: DispatchQueue? = conf.Q.map, flags: DispatchWorkItemFlags? = nil, _ body: @escaping() -> V) -> CancellablePromise<C.T> where V.U.T == C.T, E: Equatable {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(only, on: dispatcher, body)
    }
    
    /**
     The provided closure executes when this cancellable promise rejects with the specific error passed in.
     
     Unlike `catch`, `recover` continues the chain.
     Use `recover` in circumstances where recovering the chain from certain errors is a possibility. For example:
     
     firstly {
     CLLocationManager.requestLocation()
     }.recover(CLError.unknownLocation) {
     return Promise.value(CLLocation.chicago)
     }
     
     - Parameter only: The specific error to be recovered.
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter body: The handler to execute if this promise is rejected with the provided error.
     - Note: Since this method recovers only specific errors, supplying a `CatchPolicy` is unsupported. You can instead specify e.g. your cancellable error.
     - SeeAlso: [Cancellation](https://github.com/mxcl/PromiseKit/blob/master/Documentation/CommonPatterns.md#cancellation)
     */
    func recover<V: Thenable, E: Swift.Error>(_ only: E, on: DispatchQueue? = conf.Q.map, flags: DispatchWorkItemFlags? = nil, _ body: @escaping() -> V) -> CancellablePromise<C.T> where V.T == C.T, E: Equatable {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(only, on: dispatcher, body)
    }
    
    /**
     The provided closure executes when this cancellable promise rejects with an error of the type passed in.
     
     Unlike `catch`, `recover` continues the chain.
     Use `recover` in circumstances where recovering the chain from certain errors is a possibility. For example:
     
     firstly {
     API.fetchData()
     }.recover(FetchError.self) { error in
     guard case .missingImage(let partialData) = error else { throw error }
     //…
     return .value(dataWithDefaultImage)
     }
     
     - Parameter only: The error type to be recovered.
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter body: The handler to execute if this promise is rejected with the provided error type.
     - SeeAlso: [Cancellation](https://github.com/mxcl/PromiseKit/blob/master/Documentation/CommonPatterns.md#cancellation)
     */
    func recover<V: CancellableThenable, E: Swift.Error>(_ only: E.Type, on: DispatchQueue? = conf.Q.map, flags: DispatchWorkItemFlags? = nil, policy: CatchPolicy = conf.catchPolicy, _ body: @escaping(E) throws -> V) -> CancellablePromise<C.T> where V.U.T == C.T {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(only, on: dispatcher, policy: policy, body)
    }
    
    /**
     The provided closure executes when this cancellable promise rejects with an error of the type passed in.
     
     Unlike `catch`, `recover` continues the chain.
     Use `recover` in circumstances where recovering the chain from certain errors is a possibility. For example:
     
     firstly {
     API.fetchData()
     }.recover(FetchError.self) { error in
     guard case .missingImage(let partialData) = error else { throw error }
     //…
     return Promise.value(dataWithDefaultImage)
     }
     
     - Parameter only: The error type to be recovered.
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter body: The handler to execute if this promise is rejected with the provided error type.
     - SeeAlso: [Cancellation](https://github.com/mxcl/PromiseKit/blob/master/Documentation/CommonPatterns.md#cancellation)
     */
    func recover<V: Thenable, E: Swift.Error>(_ only: E.Type, on: DispatchQueue? = conf.Q.map, flags: DispatchWorkItemFlags? = nil, policy: CatchPolicy = conf.catchPolicy, _ body: @escaping(E) throws -> V) -> CancellablePromise<C.T> where V.T == C.T {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(only, on: dispatcher, policy: policy, body)
    }
    
    /**
     The provided closure executes when this cancellable promise resolves, whether it rejects or not.
     
     let context = firstly {
     UIApplication.shared.networkActivityIndicatorVisible = true
     //…  returns a cancellable promise
     }.done {
     //…
     }.ensure {
     UIApplication.shared.networkActivityIndicatorVisible = false
     }.catch {
     //…
     }.cancelContext
     
     //…
     
     context.cancel()
     
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter body: The closure that executes when this promise resolves.
     - Returns: A new promise, resolved with this promise’s resolution.
     */
    func ensure(on: DispatchQueue? = conf.Q.return, flags: DispatchWorkItemFlags? = nil, _ body: @escaping () -> Void) -> CancellablePromise<C.T> {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.return, flags: flags)
        return ensure(on: dispatcher, body)
    }
    
    /**
     The provided closure executes when this cancellable promise resolves, whether it rejects or not.
     The chain waits on the returned `CancellablePromise<Void>`.
     
     let context = firstly {
     setup() // returns a cancellable promise
     }.done {
     //…
     }.ensureThen {
     teardown()  // -> CancellablePromise<Void>
     }.catch {
     //…
     }.cancelContext
     
     //…
     
     context.cancel()
     
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter body: The closure that executes when this promise resolves.
     - Returns: A new cancellable promise, resolved with this promise’s resolution.
     */
    func ensureThen(on: DispatchQueue? = conf.Q.return, flags: DispatchWorkItemFlags? = nil, _ body: @escaping () -> CancellablePromise<Void>) -> CancellablePromise<C.T> {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.return, flags: flags)
        return ensureThen(on: dispatcher, body)
    }
}

public extension CancellableCatchMixin where C.T == Void {
    
    /**
     The provided closure executes when this cancellable promise rejects.
     
     This variant of `recover` ensures that no error is thrown from the handler and allows specifying a catch policy.
     
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter policy: The default policy does not execute your handler for cancellation errors.
     - Parameter body: The handler to execute if this promise is rejected.
     - SeeAlso: [Cancellation](https://github.com/mxcl/PromiseKit/blob/master/Documentation/CommonPatterns.md#cancellation)
     */
    func recover(on: DispatchQueue? = conf.Q.map, flags: DispatchWorkItemFlags? = nil, policy: CatchPolicy = conf.catchPolicy, _ body: @escaping(Error) throws -> Void) -> CancellablePromise<Void> {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(on: dispatcher, policy: policy, body)
    }
    
    /**
     The provided closure executes when this cancellable promise rejects with the specific error passed in.
     
     Unlike `catch`, `recover` continues the chain.
     Use `recover` in circumstances where recovering the chain from certain errors is a possibility.
     
     - Parameter only: The specific error to be recovered.
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter body: The handler to execute if this promise is rejected with the provided error.
     - Note: Since this method recovers only specific errors, supplying a `CatchPolicy` is unsupported. You can instead specify e.g. your cancellable error.
     - SeeAlso: [Cancellation](https://github.com/mxcl/PromiseKit/blob/master/Documentation/CommonPatterns.md#cancellation)
     */
    func recover<E: Swift.Error>(_ only: E, on: DispatchQueue? = conf.Q.map, flags: DispatchWorkItemFlags? = nil, _ body: @escaping() -> Void) -> CancellablePromise<Void> where E: Equatable {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(only, on: dispatcher, body)
    }
    
    /**
     The provided closure executes when this cancellable promise rejects with an error of the type passed in.
     
     Unlike `catch`, `recover` continues the chain.
     Use `recover` in circumstances where recovering the chain from certain errors is a possibility.
     
     - Parameter only: The error type to be recovered.
     - Parameter on: The queue to which the provided closure dispatches.
     - Parameter body: The handler to execute if this promise is rejected with the provided error type.
     - SeeAlso: [Cancellation](https://github.com/mxcl/PromiseKit/blob/master/Documentation/CommonPatterns.md#cancellation)
     */
    func recover<E: Swift.Error>(_ only: E.Type, on: DispatchQueue? = conf.Q.map, flags: DispatchWorkItemFlags? = nil, policy: CatchPolicy = conf.catchPolicy, _ body: @escaping(E) throws -> Void) -> CancellablePromise<Void> {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return recover(only, on: dispatcher, policy: policy, body)
    }
    
}
