import NetworkingInterfaceTestUtils
import XCTest

@testable import CSTV

final class TeamPlayersServiceTests: XCTestCase {
    private let networkingSpy = NetworkingProtocolSpy()
    
    private lazy var sut = GetTeamPlayersService(
        networking: networkingSpy
    )
    
    func test_get_shouldSendCorrectRequest() async {
        _ = await sut.get(with: "token", firstTeamId: 0, secondTeamId: 1)
        
        XCTAssertTrue(networkingSpy.requestCalled)
        XCTAssertTrue(networkingSpy.requestPassed is GetTeamPlayersRequest)
        XCTAssertTrue(networkingSpy.responseModelPassed is [TeamResponse].Type)
    }
}
