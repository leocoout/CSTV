struct GetMatchesRequest: CSTVNetworkRequest {
    private let token: String
    private let requestPage: Int
    private let beginAt: String
    
    init(
        token: String,
        requestPage: Int,
        beginAt: String
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
    
    var parameters: [CSTVListNetworkRequestBodyKey: Any] {
        [
            .perPage: 6,
            .page: requestPage,
            .beginAt: beginAt
        ]
    }
}
