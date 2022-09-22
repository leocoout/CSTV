import Foundation
import NetworkingInterface

class TeamsRepository {
    private let service: GetTeamsService
    private let tokenRepository: TokenRepositoryProtocol
    
    init(
        service: GetTeamsService,
        tokenRepository: TokenRepositoryProtocol
    ) {
        self.service = service
        self.tokenRepository = tokenRepository
    }
    
    func getPlayers(firstTeamId: Int, secondTeamId: Int) async throws -> [TeamResponse] {
        try await service.get(
            with: tokenRepository.getToken(),
            firstTeamId: firstTeamId,
            secondTeamId: secondTeamId
        )
    }
}
