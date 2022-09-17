import NetworkingInterfaceTestUtils
import XCTest

@testable import Networking

final class URLRequestFactoryTests: XCTestCase {
    private let sut = URLFactory()

    func test_make_withRequest_whenURLIsNotValid_shouldReturnNil() {
        let expectedURLRequest = sut.make(from: NetworkRequestFixture())
        
        XCTAssertNil(expectedURLRequest)
    }

    func test_make_withRequest_whenURLIsValid_shouldReturnCorrectURL() {
        let networkRequest = NetworkRequestFixture(
            baseUrl: "teste.com",
            path: "/path",
            method: .get
        )
        
        let expectedURL = sut.make(from: networkRequest)
    
        XCTAssertEqual(expectedURL?.description, "https://teste.com/path")
    }
}
