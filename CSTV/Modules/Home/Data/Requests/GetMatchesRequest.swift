import NetworkingInterface
import Foundation

struct GetMatchesRequest: HomeNetworkRequest {
    private let token: String
    private let requestPage: Int
    private let beginAt: Date
    
    init(
        token: String,
        requestPage: Int,
        beginAt: Date
    ) {
        self.token = token
        self.requestPage = requestPage
        self.beginAt = beginAt
    }
    
    var path: String {
        "/csgo/matches"
    }
    
    var header: [String : String] {
        ["authorization": token]
    }
    
    var parameters: [HomeNetworkRequestBodyKey: Any] {
        [
            .perPage: 10,
            .page: requestPage,
            .beginAt: beginAt
        ]
    }
}
