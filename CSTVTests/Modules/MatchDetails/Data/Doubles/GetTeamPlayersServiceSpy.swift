import Foundation
import NetworkingInterface

@testable import CSTV

final class GetTeamPlayersServiceSpy: GetTeamsService {
    
    private(set) var getCalled: Bool = false
    private(set) var tokenPassed: String?
    private(set) var firstTeamIdPassed: Int?
    private(set) var secondTeamIdPassed: Int?
    var getToBeReturned: Result<[TeamResponse], NetworkRequestError>?
    
    override func get(
        with token: String,
        firstTeamId: Int,
        secondTeamId: Int
    ) async -> Result<[TeamResponse], NetworkRequestError> {
        getCalled = true
        tokenPassed = token
        firstTeamIdPassed = firstTeamId
        secondTeamIdPassed = secondTeamId
        
        return getToBeReturned ?? .failure(.decode)
    }
}
