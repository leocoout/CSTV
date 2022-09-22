import XCTest

@testable import CSTV

final class NetworkingErrorToMatchListErrorAdapterTests: XCTestCase {
    func test_adaptFromNetworkError_shouldReturnGenericError() {
        XCTAssertEqual(MatchListError(from: .unknown), .generic)
        XCTAssertEqual(MatchListError(from: .decode), .generic)
    }
}
