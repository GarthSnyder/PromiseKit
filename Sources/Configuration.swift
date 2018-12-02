import Dispatch

/**
 PromiseKit’s configurable parameters.

 Do not change these after any Promise machinery executes as the configuration object is not thread-safe.

 We would like it to be, but sadly `Swift` does not expose `dispatch_once` et al. which is what we used to use in order to make the configuration immutable once first used.
*/
public struct PMKConfiguration {
    /// Backward compatibility: default DispatchQueues that promise handlers dispatch to
    public var Q: (map: DispatchQueue?, return: DispatchQueue?) {
        get { return (map: D.map as? DispatchQueue, return: D.return as? DispatchQueue) }
        set { D = (map: newValue.map ?? CurrentThreadDispatcher(), return: newValue.return ?? CurrentThreadDispatcher()) }
    }

    /// The default Dispatchers that promise handlers dispatch to
    public var D: (map: Dispatcher, return: Dispatcher) = (map: DispatchQueue.main, return: DispatchQueue.main)

    /// The default catch-policy for all `catch` and `resolve`
    public var catchPolicy = CatchPolicy.allErrorsExceptCancellation
}

/// Modify this as soon as possible in your application’s lifetime
public var conf = PMKConfiguration()
