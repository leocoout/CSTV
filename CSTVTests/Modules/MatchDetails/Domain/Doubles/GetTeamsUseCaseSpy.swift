@testable import CSTV

final class GetTeamsUseCaseSpy: GetTeamsUseCaseProtocol {
    
    private(set) var executeCalled: Bool = false
    private(set) var teamAPassed: Int?
    private(set) var teamBPassed: Int?
    var executeToBeReturned: [Team]?
    
    func execute(teamA: Int, teamB: Int) async throws -> [Team] {
        executeCalled = true
        teamAPassed = teamA
        teamBPassed = teamB
        if let executeToBeReturned {
            return executeToBeReturned
        }
        throw MatchListError.generic
    }
}
