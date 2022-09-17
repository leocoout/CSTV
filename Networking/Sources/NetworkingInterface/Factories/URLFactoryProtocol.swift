import Foundation

public protocol URLFactoryProtocol {
    func make(from request: NetworkRequest) -> URL?
}
