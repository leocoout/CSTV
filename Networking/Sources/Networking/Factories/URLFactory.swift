import Foundation
import NetworkingInterface

public class URLFactory: URLFactoryProtocol {
    public init() {}
    
    public func make(from request: NetworkRequest) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = request.scheme
        urlComponents.host = request.baseUrl
        urlComponents.path = request.path

        return urlComponents.url
    }
}
