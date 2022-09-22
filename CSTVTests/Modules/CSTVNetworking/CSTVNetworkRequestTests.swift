import XCTest

@testable import CSTV

final class CSTVNetworkRequestTests: XCTestCase {
    private let sut = TestRequest()
    
    func test_sut_propertiesShouldBeCorrect() {
        XCTAssertEqual(sut.baseUrl, "api.pandascore.co")
        XCTAssertEqual(sut.path, "/path")
        XCTAssertEqual(sut.method, .get)
        XCTAssertEqual(sut.body?["per_page"] as? Int, 5)
    }
}

private struct TestRequest: CSTVNetworkRequest {
    var parameters: [CSTV.CSTVListNetworkRequestBodyKey: Any] {
        [.perPage: 5]
    }
    
    var path: String { "/path"}
    
    var header: [String : String] { [:] }
}
