@testable import CSTV

final class GetPlayersForTeamsUseCaseSpy: GetPlayersForTeamsUseCaseProtocol {
    
    private(set) var executeCalled: Bool = false
    private(set) var teamAPassed: Int?
    private(set) var teamBPassed: Int?
    var executeToBeReturned: Result<[PlayerList], PlayerListError> = .failure(.generic)
    
    func execute(teamA: Int, teamB: Int) async -> Result<[PlayerList], PlayerListError> {
        executeCalled = true
        teamAPassed = teamA
        teamBPassed = teamB
        return executeToBeReturned
    }
}
