import NetworkingInterface

@testable import CSTV

final class MatchListRepositorySpy: MatchListRepository {
    
    private (set) var getMatchesCalled: Bool = false
    private (set) var pagePassed: Int?
    var getMatchesToBeReturned: [MatchesResponse]?
    
    override func getMatches(
        for page: Int
    ) async throws -> [MatchesResponse] {
        getMatchesCalled = true
        pagePassed = page
        if let getMatchesToBeReturned {
            return getMatchesToBeReturned
        }
        throw MatchListError.generic
    }
}
