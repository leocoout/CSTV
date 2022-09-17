import Foundation
import NetworkingInterface

public class Networking: NetworkingProtocol {

    // MARK: - Private Properties
    
    private let urlFactory: URLFactoryProtocol
    private let resultHandler: NetworkRequestResultHandling
    private let urlSession: URLSessionProtocol
    
    // MARK: - Initializer
    
    public init(
        urlFactory: URLFactoryProtocol,
        resultHandler: NetworkRequestResultHandling,
        urlSession: URLSessionProtocol = URLSession.shared
    ) {
        self.urlFactory = urlFactory
        self.resultHandler = resultHandler
        self.urlSession = urlSession
    }
    
    public func request<T: Codable>(
        _ request: NetworkRequest,
        responseModel: T.Type
    ) async -> Result<T, NetworkRequestError> {
        guard let url = urlFactory.make(from: request) else {
            return .failure(.invalidUrl)
        }
    
        do {
            let (data, response) = try await urlSession.data(from: url, delegate: nil)
            let handlerInput = NetworkRequestResultHandlerInput(response: response, data: data)
            return resultHandler.handle(handlerInput, response: responseModel)
        } catch {
            return .failure(.unknown)
        }
    }
}
