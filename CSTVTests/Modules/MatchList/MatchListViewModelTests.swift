import XCTest

@testable import CSTV

final class MatchListViewModelTests: XCTestCase {
    
    private let delegateSpy = ViewModelDelegateSpy()
    private let getMatchesForPageSpy = GetMatchesForPageUseCaseSpy()
    
    private lazy var sut: MatchListViewModel = {
        let sut = MatchListViewModel(
            getMatchesForPageUseCase: getMatchesForPageSpy
        )
        sut.delegate = delegateSpy
        return sut
    }()
    
    func test_initialize_shouldCallGetMatchesForPageUseCase() {
        sut.initialize()
        
        XCTAssertTrue(getMatchesForPageSpy.executeCalled)
    }
}
