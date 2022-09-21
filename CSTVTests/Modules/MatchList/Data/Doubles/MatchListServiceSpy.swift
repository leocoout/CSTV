import NetworkingInterface

@testable import CSTV

final class MatchListServiceSpy: MatchListService {
    
    private(set) var getCalled: Bool = false
    private(set) var tokenPassed: String?
    private(set) var pagePassed: Int?
    var getToBeReturned: Result<[MatchesResponse], NetworkRequestError>?
    
    override func get(
        with token: String,
        page: Int
    ) async -> Result<[MatchesResponse], NetworkRequestError> {
        getCalled = true
        tokenPassed = token
        pagePassed = page
        
        return getToBeReturned ?? .failure(.decode)
    }
}
