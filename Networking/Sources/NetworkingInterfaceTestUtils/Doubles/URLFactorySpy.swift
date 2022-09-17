import Foundation
import NetworkingInterface

public final class URLFactorySpy: URLFactoryProtocol {
    public init() {}
    
    public private(set) var makeCalled: Bool = false
    public private(set) var makeRequestPassed: NetworkRequest?
    public var makeToBeReturned: URL?
    
    public func make(from request: NetworkRequest) -> URL? {
        makeCalled = true
        makeRequestPassed = request
        return makeToBeReturned
    }
}
