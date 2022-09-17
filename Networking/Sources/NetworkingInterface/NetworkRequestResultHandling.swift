import Foundation

public protocol NetworkRequestResultHandling {
    func handle<T: Codable>(_ input: NetworkRequestResultHandlerInput, response: T.Type) -> Result<T, NetworkRequestError>
}

public struct NetworkRequestResultHandlerInput {
    public let response: URLResponse
    public let data: Data
    
    public init(response: URLResponse, data: Data) {
        self.response = response
        self.data = data
    }
}
