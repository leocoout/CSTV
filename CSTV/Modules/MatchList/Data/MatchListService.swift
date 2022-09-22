import NetworkingInterface

class MatchListService {
    
    private let networking: NetworkingProtocol
   
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    func get(with token: String, page: Int) async throws -> [MatchesResponse] {
        let request = GetMatchesRequest(
            token: token,
            requestPage: page
        )
        return try await networking.request(request, responseModel: [MatchesResponse].self)
    }
}
