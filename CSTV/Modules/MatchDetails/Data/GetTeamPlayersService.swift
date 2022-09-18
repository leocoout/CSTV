import NetworkingInterface
import Foundation

class GetTeamPlayersService {
    
    private let networking: NetworkingProtocol
   
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    func get(with token: String, firstTeamId: Int, secondTeamId: Int) async -> Result<[TeamResponse], NetworkRequestError> {
        let request = GetTeamPlayersRequest(
            token: token,
            firstTeamId: firstTeamId,
            secondTeamId: secondTeamId
        )
        return await networking.request(request, responseModel: [TeamResponse].self)
    }
}
