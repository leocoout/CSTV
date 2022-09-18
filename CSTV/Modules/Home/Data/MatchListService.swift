import NetworkingInterface

class MatchListService {
    
    private let networking: NetworkingProtocol
   
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    func get(with request: NetworkRequest) async -> Result<[GameMatchesResponse], NetworkRequestError> {
        await networking.request(request, responseModel: [GameMatchesResponse].self)
    }
}
