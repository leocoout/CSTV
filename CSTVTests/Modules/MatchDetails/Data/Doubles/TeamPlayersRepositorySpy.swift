import NetworkingInterface

@testable import CSTV

final class TeamPlayersRepositorySpy: TeamsRepository {
    
    private (set) var getPlayersCalled: Bool = false
    private (set) var firstTeamIdPassed: Int?
    private (set) var secondTeamIdPassed: Int?
    var getMatchesToBeReturned: [TeamResponse]?
    
    override func getPlayers(
        firstTeamId: Int,
        secondTeamId: Int
    ) async throws -> [TeamResponse] {
        getPlayersCalled = true
        firstTeamIdPassed = firstTeamId
        secondTeamIdPassed = secondTeamId
        
        if let getMatchesToBeReturned {
            return getMatchesToBeReturned
        }
        
        throw MatchListError.generic
    }
}
