@testable import CSTV

final class MatchListRouterSpy: MatchListRoutingProtocol {
   
    
    private(set) var routeToMatchDetailsCalled: Bool = false
    private(set) var routeToMatchDetailsDependenciesPassed: MatchDetailsFactory.Dependencies?
    
    func routeToMatchDetails(with dependencies: MatchDetailsFactory.Dependencies) {
        routeToMatchDetailsCalled = true
        routeToMatchDetailsDependenciesPassed = dependencies
    }
}
