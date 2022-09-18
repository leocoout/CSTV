import XCTest

@testable import CSTV

final class GetMatchesRequestTests: XCTestCase {
    private let sut = GetMatchesRequest(
        token: "token",
        requestPage: 2,
        beginAt: .fixture()
    )
    
    func test_shouldReturnCorrectProperties() {
        XCTAssertEqual(sut.path, "/csgo/matches")
        XCTAssertEqual(sut.baseUrl, "api.pandascore.co")
        XCTAssertEqual(sut.header["authorization"], "token")
        XCTAssertEqual(sut.parameters[.page] as? Int, 2)
        XCTAssertEqual(sut.parameters[.perPage] as? Int, 10)
        XCTAssertEqual(sut.parameters[.beginAt] as? Date, .fixture())
    }
}
