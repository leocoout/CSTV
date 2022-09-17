import Foundation
import NetworkingInterface

public class NetworkRequestResultHandler: NetworkRequestResultHandling {
    public init() {}
    
    public func handle<T: Codable>(_ input: NetworkRequestResultHandlerInput, response: T.Type) -> Result<T, NetworkRequestError> {
        guard let urlResponse = input.response as? HTTPURLResponse else {
            return .failure(.noResponse)
        }
        
        switch urlResponse.statusCode {
        case 200...299:
            do {
                let decodedResponse = try JSONDecoder().decode(response.self, from: input.data)
                return .success(decodedResponse)
            } catch {
                print(error)
            }
            return .failure(.decode)
        case 401:
            return .failure(.unauthorized)
        default:
            return .failure(.unknown)
        }
    }
}
