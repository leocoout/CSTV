import NetworkingInterface

struct GetTeamsRequest: CSTVNetworkRequest {
    private let token: String
    private let firstTeamId: Int
    private let secondTeamId: Int
    
    init(
        token: String,
        firstTeamId: Int,
        secondTeamId: Int
    ) {
        self.token = token
        self.firstTeamId = firstTeamId
        self.secondTeamId = secondTeamId
    }
    
    var path: String {
        "/csgo/teams"
    }
    
    var header: [String : String] {
        ["authorization": token]
    }
    
    var parameters: [CSTVListNetworkRequestBodyKey : Any] {
        [.filter(.id): "\(firstTeamId), \(secondTeamId)"]
    }
}
