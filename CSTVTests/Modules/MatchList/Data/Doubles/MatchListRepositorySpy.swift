import NetworkingInterface

@testable import CSTV

final class MatchListRepositorySpy: MatchListRepository {
    
    private (set) var getMatchesCalled: Bool = false
    private (set) var pagePassed: Int?
    var getMatchesToBeReturned: Result<[MatchesResponse], NetworkRequestError> = .failure(.unauthorized)
    
    override func getMatches(
        for page: Int
    ) async -> Result<[MatchesResponse], NetworkRequestError> {
        getMatchesCalled = true
        pagePassed = page
        return getMatchesToBeReturned
    }
}
