import NetworkingInterfaceTestUtils
import XCTest

@testable import Networking

final class NetworkResultHandlerTests: XCTestCase {
    private let sut = NetworkRequestResultHandler()
    
    func test_handle_withInput_responseIsNotHTTPURLResponse_shouldReturnNoResponse() {
        let expectedResult = sut.handle(.fixture(), response: ResponseModelDummy.self)
        
        guard case .failure(.noResponse) = expectedResult else {
            XCTFail("Should return noResponse error")
            return
        }
    }
    
    func test_handle_withInput_responseError401_shouldReturnUnauthorized() {
        let expectedResponse = HTTPURLResponseFixture.fixture(statusCode: 401)
        
        let expectedResult = sut.handle(
            .fixture(response: expectedResponse),
            response: ResponseModelDummy.self
        )
        
        guard case .failure(.unauthorized) = expectedResult else {
            XCTFail("Should return unauthorized error")
            return
        }
    }
    
    func test_handle_withInput_anyResponseError_shouldReturnUnknown() {
        let expectedResponse = HTTPURLResponseFixture.fixture(statusCode: 999)
        
        let expectedResult = sut.handle(
            .fixture(response: expectedResponse),
            response: ResponseModelDummy.self
        )
        
        guard case .failure(.unknown) = expectedResult else {
            XCTFail("Should return unknown error")
            return
        }
    }
    
    func test_handle_withInput_with200_badDecode_souldReturnDecodeError() {
        let expectedResponse = HTTPURLResponseFixture.fixture(statusCode: 200)
        
        let expectedResult = sut.handle(
            .fixture(response: expectedResponse),
            response: ResponseModelDummy.self
        )
        
        guard case .failure(.decode) = expectedResult else {
            XCTFail("Should return decode error")
            return
        }
    }
    
    func test_handle_withInput_with200_successDecoding_shouldReturnDecodedResponse() {
        let expectedResponse = HTTPURLResponseFixture.fixture(statusCode: 200)
        
        let expectedResult = sut.handle(
            .fixture(response: expectedResponse, data: correctDataToRespond ?? Data()),
            response: ResponseModelDummy.self
        )
        
        guard case .success(let response) = expectedResult else {
            XCTFail("Should return success response")
            return
        }
        
        XCTAssertTrue(response.teste)
    }
    
    private var correctDataToRespond =  """
        {
            "teste": true
        }
        """.data(using: .utf8)
}

fileprivate struct ResponseModelDummy: Codable {
    let teste: Bool
}
