@testable import CSTV

final class GetMatchesForPageUseCaseSpy: GetMatchesForPageUseCaseProtocol {
    private(set) var executeCalled: Bool = false
    var executeToBeReturned: Result<[Match], MatchListError> = .failure(.generic)
    
    func execute() async -> Result<[Match], MatchListError> {
        executeCalled = true
        return executeToBeReturned
    }
}
