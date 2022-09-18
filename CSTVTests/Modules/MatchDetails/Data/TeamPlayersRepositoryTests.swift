import NetworkingInterfaceTestUtils
import XCTest

@testable import CSTV

final class TeamPlayersRepositoryTests: XCTestCase {
    private let serviceSpy = GetTeamPlayersServiceSpy(networking: NetworkingProtocolSpy())
    private let tokenRepositorySpy = TokenRepositorySpy()
    
    private lazy var sut = TeamPlayersRepository(
        service: serviceSpy,
        tokenRepository: tokenRepositorySpy
    )
    
    func test_getMatches_shouldCallServiceWithCorrectParameters() async {
        tokenRepositorySpy.getTokenToBeReturned = "token"
        
        _ = await sut.getPlayers(firstTeamId: 0, secondTeamId: 1)
        
        XCTAssertTrue(serviceSpy.getCalled)
        XCTAssertTrue(tokenRepositorySpy.getTokenCalled)
        XCTAssertEqual(serviceSpy.tokenPassed, "token")
        XCTAssertEqual(serviceSpy.firstTeamIdPassed, 0)
        XCTAssertEqual(serviceSpy.secondTeamIdPassed, 1)
    }
    
    func test_getMatches_givenFailure_shouldReturnResponseCorrectly() async {
        serviceSpy.getToBeReturned = .failure(.unauthorized)
        
        let expectedResult = await sut.getPlayers(firstTeamId: 0, secondTeamId: 1)
        
        XCTAssertTrue(serviceSpy.getCalled)
        guard case .failure(.unauthorized) = expectedResult else {
            XCTFail("Expected result to be unauthorized error")
            return
        }
    }
    
    func test_getMatches_givenSuccess_shouldReturnResponseCorrectly() async {
        serviceSpy.getToBeReturned = .success([.fixture(id: 123)])
        
        let expectedResult = await sut.getPlayers(firstTeamId: 0, secondTeamId: 1)
        
        XCTAssertTrue(serviceSpy.getCalled)
        guard case .success(let response) = expectedResult else {
            XCTFail("Expected result to be success")
            return
        }
        
        XCTAssertEqual(response.first?.id, 123)
    }
}
