import XCTest

@testable import CSTV

final class GetTeamPlayersRequestTests: XCTestCase {
    private let sut = GetTeamPlayersRequest(
        token: "token",
        firstTeamId: 0,
        secondTeamId: 1
    )
    
    func test_shouldReturnCorrectProperties() {
        XCTAssertEqual(sut.path, "/csgo/teams")
        XCTAssertEqual(sut.baseUrl, "api.pandascore.co")
        XCTAssertEqual(sut.header["authorization"], "token")
        XCTAssertEqual(sut.parameters[.filter(.id)] as? String, "0, 1")
    }
}
