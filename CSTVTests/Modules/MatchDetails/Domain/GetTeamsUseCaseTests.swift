import NetworkingInterfaceTestUtils
import XCTest

@testable import CSTV

final class GetTeamsUseCaseTests: XCTestCase {
    private let serviceSpy = GetTeamPlayersServiceSpy(networking: NetworkingProtocolSpy())
    
    private lazy var repositorySpy = TeamPlayersRepositorySpy(
        service: serviceSpy,
        tokenRepository: TokenRepositorySpy()
    )
    
    private lazy var sut = GetTeamsUseCase(
        repository: repositorySpy
    )
    
    func test_execute_givenSuccess_shouldReturnCorrectProperties() async {
        repositorySpy.getMatchesToBeReturned = .success([.fixture(id: 1)])
        
        let expectedResult = await sut.execute(teamA: 0, teamB: 1)
        
        guard case .success(let list) = expectedResult else {
            XCTFail("expected generic error failure")
            return
        }
        
        XCTAssertTrue(repositorySpy.getPlayersCalled)
        XCTAssertEqual(list.first?.id, 1)
    }
    
    func test_execute_givenError_shoulReturnCorrectError() async {
        repositorySpy.getMatchesToBeReturned = .failure(.unauthorized)
        
        let expectedResult = await sut.execute(teamA: 0, teamB: 1)
        
        guard case .failure(.generic) = expectedResult else {
            XCTFail("expected generic error failure")
            return
        }
    }
}
