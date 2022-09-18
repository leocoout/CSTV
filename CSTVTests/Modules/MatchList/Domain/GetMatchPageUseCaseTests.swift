import NetworkingInterfaceTestUtils
import XCTest

@testable import CSTV

final class GetMatchesForPageUseCaseTests: XCTestCase {
    private let serviceSpy = MatchListServiceSpy(networking: NetworkingProtocolSpy())
    
    private lazy var repositorySpy = MatchListRepositorySpy(
        service: serviceSpy,
        tokenRepository: TokenRepositorySpy()
    )
    
    private lazy var sut = GetMatchesForPageUseCase(
        repository: repositorySpy,
        currentDate: .fixture()
    )
    
    func test_execute_givenSuccess_shouldReturnCorrectProperties() async {
        repositorySpy.getMatchesToBeReturned = .success([.fixture(id: 0000)])
        
        let expectedResult = await sut.execute()
        
        guard case .success(let list) = expectedResult else {
            XCTFail("expected generic error failure")
            return
        }
        
        XCTAssertEqual(list.first?.id, 0000)
    }
    
    func test_execute_givenError_shoulReturnCorrectError() async {
        repositorySpy.getMatchesToBeReturned = .failure(.unauthorized)
        
        let expectedResult = await sut.execute()
        
        guard case .failure(.generic) = expectedResult else {
            XCTFail("expected generic error failure")
            return
        }
    }
    
    func test_execute_shouldIncrementPageCorrectly() async {
        _ = await sut.execute()
        XCTAssertEqual(repositorySpy.pagePassed, 1)
        
        _ = await sut.execute()
        XCTAssertEqual(repositorySpy.pagePassed, 2)
    }
    
    func test_execute_shouldCallRepositoryWithCorrectDate() async {
        _ = await sut.execute()
        
        XCTAssertTrue(repositorySpy.getMatchesCalled)
        XCTAssertEqual(repositorySpy.beginningAtDatePassed, "2016-04-14 07:44:00")
    }
}
