import NetworkingInterface

@testable import CSTV

final class MatchListServiceSpy: MatchListService {
    
    private(set) var getCalled: Bool = false
    private(set) var tokenPassed: String?
    private(set) var pagePassed: Int?
    var getToBeReturned: [MatchesResponse]?
    
    override func get(
        with token: String,
        page: Int
    ) async throws -> [MatchesResponse] {
        getCalled = true
        tokenPassed = token
        pagePassed = page
        
        if let getToBeReturned {
            return getToBeReturned
        }
        
        throw MatchListError.generic
    }
}
