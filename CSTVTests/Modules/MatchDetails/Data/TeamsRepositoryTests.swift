import NetworkingInterfaceTestUtils
import XCTest

@testable import CSTV

final class TeamsRepositoryTests: XCTestCase {
    private let serviceSpy = GetTeamsServiceSpy(networking: NetworkingProtocolSpy())
    private let tokenRepositorySpy = TokenRepositorySpy()
    
    private lazy var sut = TeamsRepository(
        service: serviceSpy,
        tokenRepository: tokenRepositorySpy
    )
    
    func test_getMatches_shouldCallServiceWithCorrectParameters() async throws {
        tokenRepositorySpy.getTokenToBeReturned = "token"
        
        do {
            _ = try await sut.getPlayers(firstTeamId: 0, secondTeamId: 1)
        } catch {
            XCTAssertTrue(serviceSpy.getCalled)
            XCTAssertTrue(tokenRepositorySpy.getTokenCalled)
            XCTAssertEqual(serviceSpy.tokenPassed, "token")
            XCTAssertEqual(serviceSpy.firstTeamIdPassed, 0)
            XCTAssertEqual(serviceSpy.secondTeamIdPassed, 1)
        }
    }
    
    func test_getMatches_givenFailure_shouldReturnResponseCorrectly() async throws {
        do {
            _ = try await sut.getPlayers(firstTeamId: 0, secondTeamId: 1)
        } catch let error as TeamError {
            XCTAssertTrue(serviceSpy.getCalled)
            XCTAssertEqual(error, .generic)
        }
    }
    
    func test_getMatches_givenSuccess_shouldReturnResponseCorrectly() async throws {
        serviceSpy.getToBeReturned = [.fixture(id: 123)]
        
        let expectedResult = try await sut.getPlayers(firstTeamId: 0, secondTeamId: 1)
        
        XCTAssertTrue(serviceSpy.getCalled)
        XCTAssertEqual(expectedResult.first?.id, 123)
    }
}
