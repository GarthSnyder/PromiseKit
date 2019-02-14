import Foundation

public class RateLimitedDispatcherBase: Dispatcher {
    
    let maxDispatches: Int
    let interval: TimeInterval
    let queue: Dispatcher
    
    internal let serializer = DispatchQueue(label: "RLD serializer")
    
    internal var nScheduled = 0
    internal var undispatched = Queue<() -> Void>()
    
    internal var cleanupNonce: Int64 = 0
    internal var cleanupWorkItem: DispatchWorkItem? { willSet { cleanupWorkItem?.cancel() }}
    
    public init(maxDispatches: Int, perInterval interval: TimeInterval, queue: Dispatcher = DispatchQueue.global()) {
        self.maxDispatches = maxDispatches
        self.interval = interval
        self.queue = queue
    }
    
    public func dispatch(_ body: @escaping () -> Void) {
        serializer.async {
            self.undispatched.enqueue(body)
            self.dispatchFromQueue()
        }
    }
    
    internal func dispatchFromQueue() {
        fatalError("Subclass responsibility")
    }
    
    internal func recordActualStart() {
        nScheduled -= 1
        dispatchFromQueue()
        if nScheduled == 0 && undispatched.isEmpty {
            scheduleCleanup()
        }
    }
    
    internal func scheduleCleanup() {
        cleanupWorkItem = DispatchWorkItem { [ weak self, nonce = self.cleanupNonce ] in
            self?.cleanup(nonce)
        }
        print("cleanup sched", (DispatchTime.now() + interval).rawValue)
        serializer.asyncAfter(deadline: DispatchTime.now() + interval, execute: cleanupWorkItem!)
    }
    
    internal func cleanup(_ nonce: Int64) {
        // Calls to cleanup() have to go through the serializer queue, so by by the time
        // we get here, more activity may have occurred. Ergo, verify nonce.
        print("cleanup run at", DispatchTime.now().rawValue, "nonce OK:", nonce == cleanupNonce)
        guard nonce == cleanupNonce else { return }
        undispatched.compactStorage()
        cleanupWorkItem = nil
    }
    
}
