@testable import CSTV

final class GetMatchesForPageUseCaseSpy: GetMatchesForPageUseCaseProtocol {
    private(set) var executeCalled: Bool = false
    var executeToBeReturned: Result<[MatchList], MatchListError> = .failure(.generic)
    
    func execute() async -> Result<[MatchList], MatchListError> {
        executeCalled = true
        return executeToBeReturned
    }
}
