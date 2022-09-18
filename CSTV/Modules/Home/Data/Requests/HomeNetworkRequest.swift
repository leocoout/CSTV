import NetworkingInterface

protocol HomeNetworkRequest: NetworkRequest {
    var parameters: [HomeNetworkRequestBodyKey: Any] { get }
}

extension HomeNetworkRequest {
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

enum HomeNetworkRequestBodyKey: String {
    case page = "page"
    case perPage = "per_page"
    case beginAt = "begin_at"
}
