import NetworkingInterfaceTestUtils
import XCTest

@testable import CSTV

final class TeamPlayersServiceTests: XCTestCase {
    private let networkingSpy = NetworkingProtocolSpy()
    
    private lazy var sut = GetTeamsService(
        networking: networkingSpy
    )
    
    func test_get_shouldSendCorrectRequest() async throws {
        do {
            _ = try await sut.get(with: "token", firstTeamId: 0, secondTeamId: 1)
        } catch {
            XCTAssertTrue(networkingSpy.requestCalled)
            XCTAssertTrue(networkingSpy.requestPassed is GetTeamsRequest)
            XCTAssertTrue(networkingSpy.responseModelPassed is [TeamResponse].Type)
        }
    }
}
