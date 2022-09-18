import XCTest

@testable import CSTV

final class MatchListViewModelTests: XCTestCase {
    
    private let getMatchesForPageSpy = GetMatchesForPageUseCaseSpy()
    
    private lazy var sut: MatchListViewModel = MatchListViewModel(
        getMatchesForPageUseCase: getMatchesForPageSpy
    )
    
    func test_initialize_shouldCallGetMatchesForPageUseCase() {
        let expectation = expectation(description: "Waiting for mocked response")
        
        sut.initialize()
        expectation.fulfill()
        
        waitForExpectations(timeout: 0.1, handler: nil)
        
        XCTAssertTrue(getMatchesForPageSpy.executeCalled)
    }
    
    func test_initialize_getMatchesForPage_givenSuccess_shouldUpdateMatchList() {
        let expectation = expectation(description: "Waiting for mocked response")
        getMatchesForPageSpy.executeToBeReturned = .success([.fixture(id: 11)])
        
        sut.didUpdateMatchList = { list in
            expectation.fulfill()
            XCTAssertEqual(list.first?.id, 11)
        }
        
        sut.initialize()
        waitForExpectations(timeout: 0.1, handler: nil)
        
        XCTAssertTrue(getMatchesForPageSpy.executeCalled)
    }
}
