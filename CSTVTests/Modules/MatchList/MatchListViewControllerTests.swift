import XCTest

@testable import CSTV

final class MatchListViewControllerTests: XCTestCase {
    private let viewModelSpy = MatchListViewModelSpy()
    private let tableViewResponderSpy = MatchListTableViewResponderSpy()
    private let routerSpy = MatchListRouterSpy()
    
    private lazy var sut = MatchListViewController(
        viewModel: viewModelSpy,
        tableViewResponder: tableViewResponderSpy,
        router: routerSpy
    )
    
    func test_hadleMatchSelection_shouldCallRouter() {
        sut.handleMatchSelection(.fixture())
        
        XCTAssertTrue(routerSpy.routeToMatchDetailsCalled)
    }
}
