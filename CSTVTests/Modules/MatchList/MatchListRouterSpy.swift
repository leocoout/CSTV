@testable import CSTV

final class MatchListRouterSpy: MatchListRoutingProtocol {
    private(set) var routeToMatchDetailsCalled: Bool = false
    
    func routeToMatchDetails() {
        routeToMatchDetailsCalled = true
    }
}
