import XCTest

@testable import CSTV

final class MatchListViewControllerTests: XCTestCase {
    private let viewModelSpy = MatchListViewModelSpy()
    private lazy var sut = MatchListViewController(
        viewModel: viewModelSpy
    )
    
    func test_viewDidLoad_shouldCallInitialize() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewModelSpy.initializeCalled)
    }
}
