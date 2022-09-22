import NetworkingInterface
import Foundation

class GetTeamsService {
    
    private let networking: NetworkingProtocol
   
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    func get(with token: String, firstTeamId: Int, secondTeamId: Int) async throws -> [TeamResponse] {
        let request = GetTeamsRequest(
            token: token,
            firstTeamId: firstTeamId,
            secondTeamId: secondTeamId
        )
        return try await networking.request(request, responseModel: [TeamResponse].self)
    }
}
