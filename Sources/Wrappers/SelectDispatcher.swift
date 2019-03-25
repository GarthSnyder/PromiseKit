import Dispatch

// This hairball disambiguates all the various combinations of explicit arguments, default
// arguments, and configured defaults. In particular, a method that is given explicit work item
// flags but no DispatchQueue should still work (that is, the dispatcher should use those flags)
// as long as the configured default is actually some kind of DispatchQueue.

internal func selectDispatcher(given: DispatchQueue?, configured: Dispatcher, flags: DispatchWorkItemFlags?) -> Dispatcher {
    guard let given = given else {
        if flags != nil {
            conf.logHandler(.nilDispatchQueueWithFlags)
        }
        return CurrentThreadDispatcher()
    }
    if given !== DispatchQueue.pmkDefault {
        return given.asDispatcher(flags: flags)
    } else if let flags = flags, let configured = configured as? DispatchQueue {
        return configured.asDispatcher(flags: flags)
    } else if flags != nil {
        conf.logHandler(.extraneousFlagsSpecified)
    }
    return configured
}
