import NetworkingInterface

protocol MatchListNetworkRequest: NetworkRequest {
    var parameters: [MatchListNetworkRequestBodyKey: Any] { get }
}

extension MatchListNetworkRequest {
    var baseUrl: String {
        "api.pandascore.co"
    }
    
    var method: NetworkingInterface.NetworkRequestMethod {
        .get
    }
    
    var body: [String: Any]? {
        var modifiedBody: [String: Any] = [:]
        
        for (key, value) in parameters {
            modifiedBody[key.rawValue] = value
        }
        
        return modifiedBody
    }
}

enum MatchListNetworkRequestBodyKey: String {
    case page = "page"
    case perPage = "per_page"
    case beginAt = "begin_at"
}
