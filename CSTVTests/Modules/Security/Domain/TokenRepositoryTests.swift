import XCTest

@testable import CSTV

final class TokenRepositoryTests: XCTestCase {
    
    private let keychainProviderSpy = KeychainProviderSpy()
    
    private lazy var sut = TokenRepository(
        keychainProvider: keychainProviderSpy
    )
    
    func test_execute_whenTokenAlreadyExists_shouldReturnItsValue() {
        keychainProviderSpy.stringToBeReturned = "token"
        
        let expectedToken = sut.getToken()
        
        XCTAssertTrue(keychainProviderSpy.stringCalled)
        XCTAssertFalse(keychainProviderSpy.setCalled)
        XCTAssertEqual(keychainProviderSpy.stringKeyPassed, "access-token")
        XCTAssertEqual(expectedToken, "token")
    }
    
    func test_execute_whenTokenDoesNotExists_shouldSetAndThenReturnItsvalue() {
        let expectedToken = sut.getToken()
        
        XCTAssertTrue(keychainProviderSpy.stringCalled)
        XCTAssertTrue(keychainProviderSpy.setCalled)
        XCTAssertEqual(keychainProviderSpy.setKeyPassed, "access-token")
        XCTAssertEqual(expectedToken, "Bearer z77WD0DUaTynMDfNxqiUKGtC4k0w2IbUBPiOl35EQ9bhgABOxzw")
    }
}
