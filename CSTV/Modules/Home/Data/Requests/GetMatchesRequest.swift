import NetworkingInterface

struct GetMatchesRequest: HomeNetworkRequest {
    var path: String {
        "/matches"
    }
    
    var method: NetworkingInterface.NetworkRequestMethod {
        .get
    }
    
    var header: [String : String]?
    
    var body: [String : String]?
}
