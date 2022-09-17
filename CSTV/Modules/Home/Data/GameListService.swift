import NetworkingInterface

class GameListService {
    
    private let networking: NetworkingProtocol
   
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    func get(with request: NetworkRequest) async -> Result<[GameListResponse], NetworkRequestError> {
        await networking.request(request, responseModel: [GameListResponse].self)
    }
}
