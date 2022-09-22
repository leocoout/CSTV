@testable import CSTV

final class GetMatchesForPageUseCaseSpy: GetMatchesForPageUseCaseProtocol {
    private(set) var executeCalled: Bool = false
    var executeToBeReturned: [Match]?
    
    func execute() async throws -> [Match] {
        executeCalled = true
        if let executeToBeReturned {
            return executeToBeReturned
        }
        
        throw MatchListError.generic
    }
}
