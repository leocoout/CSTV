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
    
    func test_execute_givenSuccess_shouldReturnCorrectProperties() async throws {
        repositorySpy.getMatchesToBeReturned = [.fixture(games: [.fixture()])]
        
        let expectedResult = try await sut.execute()
        XCTAssertNotNil(expectedResult.first)
    }
    
    func test_execute_givenError_shoulReturnCorrectError() async throws {
        do {
            _ = try await sut.execute()
        } catch let error as MatchListError {
            XCTAssertEqual(error, .generic)
        }
    }
    
    func test_execute_shouldIncrementPageCorrectly() async throws {
        repositorySpy.getMatchesToBeReturned = [.fixture()]
        
        do {
            _ = try await sut.execute()
            _ = try await sut.execute()
        } catch {
            XCTAssertEqual(repositorySpy.pagePassed, 2)
        }
    }
}
