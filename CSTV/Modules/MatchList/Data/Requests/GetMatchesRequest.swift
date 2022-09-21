struct GetMatchesRequest: CSTVNetworkRequest {
    private let token: String
    private let requestPage: Int
    
    init(
        token: String,
        requestPage: Int
    ) {
        self.token = token
        self.requestPage = requestPage
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
            .sort: CSTVSortType.minusStatus.rawValue
        ]
    }
}
