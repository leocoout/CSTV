import NetworkingInterface

protocol CSTVNetworkRequest: NetworkRequest {
    var parameters: [CSTVListNetworkRequestBodyKey: Any] { get }
}

extension CSTVNetworkRequest {
    var baseUrl: String {
        "api.pandascore.co"
    }
    
    var method: NetworkingInterface.NetworkRequestMethod {
        .get
    }
    
    var body: [String: Any]? {
        var modifiedBody: [String: Any] = [:]
        
        for (key, value) in parameters {
            modifiedBody[key.description] = value
        }
        
        return modifiedBody
    }
}

enum CSTVListNetworkRequestBodyKey: Hashable {
    case page
    case perPage
    case beginAt
    case filter(CSTVFilterType)
    
    var description: String {
        switch self {
        case .page:
            return "page"
        case .perPage:
            return "per_page"
        case .beginAt:
            return "begin_at"
        case .filter(let type):
            return "filter[\(type)]"
        }
    }
}

enum CSTVFilterType: String {
    case id = "id"
}
