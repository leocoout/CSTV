import NetworkingInterface

@testable import CSTV

final class MatchListRepositorySpy: MatchListRepository {
    
    private (set) var getMatchesCalled: Bool = false
    private (set) var pagePassed: Int?
    private (set) var beginningAtDatePassed: String?
    var getMatchesToBeReturned: Result<[MatchesResponse], NetworkRequestError> = .failure(.unauthorized)
    
    override func getMatches(
        for page: Int,
        beginningAt date: String
    ) async -> Result<[MatchesResponse], NetworkRequestError> {
        getMatchesCalled = true
        pagePassed = page
        beginningAtDatePassed = date
        return getMatchesToBeReturned
    }
}
