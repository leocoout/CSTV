import Foundation
import NetworkingInterface

public final class URLSessionSpy: URLSessionProtocol {
    public init() {}
    
    public private(set) var dataCalled: Bool = false
    public private(set) var dataURLPassed: URL?
    public private(set) var dataDelegatePassed: URLSessionTaskDelegate?
    public var dataToBeReturned: (Data, URLResponse) = (Data(), URLResponse())
    
    public func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        dataCalled = true
        dataURLPassed = url
        dataDelegatePassed = delegate
        return dataToBeReturned
    }
    
}
