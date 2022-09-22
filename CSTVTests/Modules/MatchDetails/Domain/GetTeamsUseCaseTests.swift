import NetworkingInterfaceTestUtils
import XCTest

@testable import CSTV

final class GetTeamsUseCaseTests: XCTestCase {
    private let serviceSpy = GetTeamsServiceSpy(networking: NetworkingProtocolSpy())
    
    private lazy var repositorySpy = TeamPlayersRepositorySpy(
        service: serviceSpy,
        tokenRepository: TokenRepositorySpy()
    )
    
    private lazy var sut = GetTeamsUseCase(
        repository: repositorySpy
    )
    
    func test_execute_givenSuccess_shouldReturnCorrectProperties() async throws {
        repositorySpy.getMatchesToBeReturned = [.fixture(id: 1)]
        
        let expectedResult = try await sut.execute(teamA: 0, teamB: 1)
        
        XCTAssertTrue(repositorySpy.getPlayersCalled)
        XCTAssertEqual(expectedResult.first?.id, 1)
    }
    
    func test_execute_givenError_shoulReturnCorrectError() async throws {
        do {
            let _ = try await sut.execute(teamA: 0, teamB: 1)
        } catch let error as TeamError {
            XCTAssertEqual(error, .generic)
        }
    }
}
