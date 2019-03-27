// Since Guarantees have no error path, closures in the API are nonthrowing, which
// makes them different from the shared Promise/CancellablePromise API.

import Dispatch

public extension Guarantee {
    
    @discardableResult
    func then<U>(on: DispatchQueue? = .pmkDefault, flags: DispatchWorkItemFlags? = nil, _ body: @escaping(T) -> Guarantee<U>) -> Guarantee<U> {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return then(on: dispatcher, body)
    }
    
    func map<U>(on: DispatchQueue? = .pmkDefault, flags: DispatchWorkItemFlags? = nil, _ body: @escaping(T) -> U) -> Guarantee<U> {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.map, flags: flags)
        return map(on: dispatcher, body)
    }
    
    @discardableResult
    func done(on: DispatchQueue? = .pmkDefault, flags: DispatchWorkItemFlags? = nil, _ body: @escaping(T) -> Void) -> Guarantee<Void> {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.return, flags: flags)
        return done(on: dispatcher, body)
    }
    
    func get(on: DispatchQueue? = .pmkDefault, flags: DispatchWorkItemFlags? = nil, _ body: @escaping (T) -> Void) -> Guarantee<T> {
        let dispatcher = selectDispatcher(given: on, configured: conf.D.return, flags: flags)
        return get(on: dispatcher, body)
    }
}
