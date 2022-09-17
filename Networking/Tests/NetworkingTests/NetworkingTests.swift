import Foundation
import NetworkingInterface
import NetworkingInterfaceTestUtils
import XCTest

@testable import Networking

final class NetworkingTests: XCTestCase {
    private let urlFactorySpy = URLFactorySpy()
    private let resultHandlerSpy = NetworkRequestResultHandlerSpy()
    private let urlSessionSpy = URLSessionSpy()
    
    private lazy var sut = Networking(
        urlFactory: urlFactorySpy,
        resultHandler: resultHandlerSpy,
        urlSession: urlSessionSpy
    )
    
    func test_request_withInvalidURL_shouldReturnInvalidURLError() async {
        urlFactorySpy.makeToBeReturned = nil
        
        let expectedResult = await sut.request(NetworkRequestFixture(), responseModel: ResponseModelDummy.self)
        
        XCTAssertTrue(urlFactorySpy.makeCalled)
        XCTAssertTrue(urlFactorySpy.makeRequestPassed is NetworkRequestFixture)
        
        guard case .failure(.invalidUrl) = expectedResult else {
            XCTFail("Should return invalidUrl error")
            return
        }
    }
}

fileprivate class ResponseModelDummy: Codable {}
