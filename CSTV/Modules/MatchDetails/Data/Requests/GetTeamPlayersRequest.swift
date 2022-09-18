import NetworkingInterface

struct GetTeamPlayersRequest: CSTVNetworkRequest {
    private let token: String
    private let desiredTeamIds: [Int]
    
    init(
        token: String,
        desiredTeamIds: [Int]
    ) {
        self.token = token
        self.desiredTeamIds = desiredTeamIds
    }
    
    var path: String {
        "/csgo/teams"
    }
    
    var header: [String : String] {
        ["authorization": token]
    }
    
    var parameters: [CSTVListNetworkRequestBodyKey : Any] {
        [.filter(.id): desiredTeamIds]
    }
}
