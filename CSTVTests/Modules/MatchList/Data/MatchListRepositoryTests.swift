import NetworkingInterfaceTestUtils
import XCTest

@testable import CSTV

final class MatchListRepositoryTests: XCTestCase {
//    private let serviceSpy = MatchListServiceSpy(networking: NetworkingProtocolSpy())
//    private let tokenRepositorySpy = TokenRepositorySpy()
//    
//    private lazy var sut = MatchListRepository(
//        service: serviceSpy,
//        tokenRepository: tokenRepositorySpy
//    )
//    
//    func test_getMatches_shouldCallServiceWithCorrectParameters() async {
//        tokenRepositorySpy.getTokenToBeReturned = "token"
//        
//        _ = await sut.getMatches(for: 2, beginningAt: "date")
//        
//        XCTAssertTrue(serviceSpy.getCalled)
//        XCTAssertTrue(tokenRepositorySpy.getTokenCalled)
//        XCTAssertEqual(serviceSpy.tokenPassed, "token")
//        XCTAssertEqual(serviceSpy.pagePassed, 2)
//        XCTAssertEqual(serviceSpy.begginingAtPassed, "date")
//    }
//    
//    func test_getMatches_givenFailure_shouldReturnResponseCorrectly() async {
//        serviceSpy.getToBeReturned = .failure(.unauthorized)
//        
//        let expectedResult = await sut.getMatches(for: 2, beginningAt: "")
//        
//        XCTAssertTrue(serviceSpy.getCalled)
//        guard case .failure(.unauthorized) = expectedResult else {
//            XCTFail("Expected result to be unauthorized error")
//            return
//        }
//    }
//    
//    func test_getMatches_givenSuccess_shouldReturnResponseCorrectly() async {
//        serviceSpy.getToBeReturned = .success([.fixture(id: 123)])
//        
//        let expectedResult = await sut.getMatches(for: 2, beginningAt: "")
//        
//        XCTAssertTrue(serviceSpy.getCalled)
//        guard case .success(let response) = expectedResult else {
//            XCTFail("Expected result to be success")
//            return
//        }
//        
//        XCTAssertEqual(response.first?.id, 123)
//    }
}
