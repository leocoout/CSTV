import Foundation

@testable import CSTV

final class DispatchQueueSpy: DispatchQueueProtocol {
    private(set) var asyncCalled: Bool = false
    var callback: (() -> Void)?
    
    func async(
        group: DispatchGroup?,
        qos: DispatchQoS,
        flags: DispatchWorkItemFlags,
        execute work: @escaping @convention(block) () -> Void
    ) {
        asyncCalled = true
        callback?()
        work()
    }
}
