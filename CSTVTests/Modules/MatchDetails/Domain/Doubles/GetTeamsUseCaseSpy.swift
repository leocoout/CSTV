@testable import CSTV

final class GetTeamsUseCaseSpy: GetTeamsUseCaseProtocol {
    
    private(set) var executeCalled: Bool = false
    private(set) var teamAPassed: Int?
    private(set) var teamBPassed: Int?
    var executeToBeReturned: Result<[Team], TeamError> = .failure(.generic)
    
    func execute(teamA: Int, teamB: Int) async -> Result<[Team], TeamError> {
        executeCalled = true
        teamAPassed = teamA
        teamBPassed = teamB
        return executeToBeReturned
    }
}
