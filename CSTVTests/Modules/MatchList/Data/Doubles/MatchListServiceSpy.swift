import NetworkingInterface

@testable import CSTV

final class MatchListServiceSpy: MatchListService {
    
    private(set) var getCalled: Bool = false
    private(set) var tokenPassed: String?
    private(set) var pagePassed: Int?
    private(set) var begginingAtPassed: String?
    var getToBeReturned: Result<[MatchesResponse], NetworkRequestError>?
    
    override func get(
        with token: String,
        page: Int,
        begginingAt: String
    ) async -> Result<[MatchesResponse], NetworkRequestError> {
        getCalled = true
        tokenPassed = token
        pagePassed = page
        begginingAtPassed = begginingAt
        
        return getToBeReturned ?? .failure(.decode)
    }
}
