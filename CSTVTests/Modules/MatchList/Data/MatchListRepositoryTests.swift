import NetworkingInterfaceTestUtils
import XCTest

@testable import CSTV

final class MatchListRepositoryTests: XCTestCase {
    private let serviceSpy = MatchListServiceSpy(networking: NetworkingProtocolSpy())
    private let tokenRepositorySpy = TokenRepositorySpy()
    
    private lazy var sut = MatchListRepository(
        service: serviceSpy,
        tokenRepository: tokenRepositorySpy
    )
    
    func test_getMatches_shouldCallServiceWithCorrectParameters() async throws {
        tokenRepositorySpy.getTokenToBeReturned = "token"
        
        do {
            _ = try await sut.getMatches(for: 2)
        } catch {
            XCTAssertTrue(serviceSpy.getCalled)
            XCTAssertTrue(tokenRepositorySpy.getTokenCalled)
            XCTAssertEqual(serviceSpy.tokenPassed, "token")
            XCTAssertEqual(serviceSpy.pagePassed, 2)
        }
    }
    
    func test_getMatches_givenFailure_shouldReturnResponseCorrectly() async throws{
        
        do {
            _ = try await sut.getMatches(for: 2)
        } catch let error as MatchListError{
            XCTAssertTrue(serviceSpy.getCalled)
            XCTAssertEqual(error, .generic)
        }
    }
    
    func test_getMatches_givenSuccess_shouldReturnResponseCorrectly() async throws {
        serviceSpy.getToBeReturned = [.fixture()]
        
        let expectedResult = try await sut.getMatches(for: 2)
        
        XCTAssertTrue(serviceSpy.getCalled)
        XCTAssertNotNil(expectedResult.first)
    }
}
