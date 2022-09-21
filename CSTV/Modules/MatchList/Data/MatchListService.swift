import NetworkingInterface

class MatchListService {
    
    private let networking: NetworkingProtocol
   
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    func get(with token: String, page: Int) async -> Result<[MatchesResponse], NetworkRequestError> {
        let request = GetMatchesRequest(
            token: token,
            requestPage: page
        )
        return await networking.request(request, responseModel: [MatchesResponse].self)
    }
}
