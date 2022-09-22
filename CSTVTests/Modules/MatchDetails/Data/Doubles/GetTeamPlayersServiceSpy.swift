import Foundation
import NetworkingInterface

@testable import CSTV

final class GetTeamsServiceSpy: GetTeamsService {
    
    private(set) var getCalled: Bool = false
    private(set) var tokenPassed: String?
    private(set) var firstTeamIdPassed: Int?
    private(set) var secondTeamIdPassed: Int?
    var getToBeReturned: [TeamResponse]?
    
    override func get(
        with token: String,
        firstTeamId: Int,
        secondTeamId: Int
    ) async throws -> [TeamResponse] {
        getCalled = true
        tokenPassed = token
        firstTeamIdPassed = firstTeamId
        secondTeamIdPassed = secondTeamId
        
        if let getToBeReturned {
            return getToBeReturned
        }
        
        throw TeamError.generic
    }
}
