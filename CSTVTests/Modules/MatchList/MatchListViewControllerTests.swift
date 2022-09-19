import XCTest

@testable import CSTV

final class MatchListViewControllerTests: XCTestCase {
    private let viewModelSpy = MatchListViewModelSpy()
    private let tableViewResponderSpy = MatchListTableViewResponderSpy()
    
    private lazy var sut = MatchListViewController(
        viewModel: viewModelSpy,
        tableViewResponder: tableViewResponderSpy
    )
}
