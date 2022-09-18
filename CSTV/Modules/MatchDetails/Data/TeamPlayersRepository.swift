import Foundation
import NetworkingInterface

final class TeamPlayersRepository {
    private let service: GetTeamPlayersService
    private let tokenRepository: TokenRepositoryProtocol
    
    init(
        service: GetTeamPlayersService,
        tokenRepository: TokenRepositoryProtocol
    ) {
        self.service = service
        self.tokenRepository = tokenRepository
    }
    
    func getPlayers(firstTeamId: Int, secondTeamId: Int) async -> Result<[TeamResponse], NetworkRequestError> {
        await service.get(
            with: tokenRepository.getToken(),
            firstTeamId: firstTeamId,
            secondTeamId: secondTeamId
        )
    }
}
