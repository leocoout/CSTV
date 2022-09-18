import NetworkingInterface

@testable import CSTV

final class TeamPlayersRepositorySpy: TeamsRepository {
    
    private (set) var getPlayersCalled: Bool = false
    private (set) var firstTeamIdPassed: Int?
    private (set) var secondTeamIdPassed: Int?
    var getMatchesToBeReturned: Result<[TeamResponse], NetworkRequestError> = .failure(.unauthorized)
    
    override func getPlayers(
        firstTeamId: Int,
        secondTeamId: Int
    ) async -> Result<[TeamResponse], NetworkRequestError> {
        getPlayersCalled = true
        firstTeamIdPassed = firstTeamId
        secondTeamIdPassed = secondTeamId
        return getMatchesToBeReturned
    }
}
