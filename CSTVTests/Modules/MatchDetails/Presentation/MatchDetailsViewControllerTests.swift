import XCTest

@testable import CSTV

final class MatchDetailsViewControllerTests: XCTestCase {
    private let viewModelSpy = MatchDetailsViewModelSpy()
    
    private lazy var sut = MatchDetailsViewController(
        viewModel: viewModelSpy
    )
}
