import NetworkingInterfaceTestUtils
import XCTest

@testable import CSTV

final class MatchListServiceTests: XCTestCase {
    private let networkingSpy = NetworkingProtocolSpy()
    
    private lazy var sut = MatchListService(
        networking: networkingSpy
    )
    
    func test_get_shouldSendCorrectRequest() async throws {
        do {
            _ = try await sut.get(with: "token", page: 2)
        } catch {
            XCTAssertTrue(networkingSpy.requestCalled)
            XCTAssertTrue(networkingSpy.requestPassed is GetMatchesRequest)
            XCTAssertTrue(networkingSpy.responseModelPassed is [MatchesResponse].Type)
        }
    }
}
