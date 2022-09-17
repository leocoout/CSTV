import XCTest

@testable import CSTV

final class GetTokenUseCaseTests: XCTestCase {
    
    private let keychainProviderSpy = KeychainProviderSpy()
    private let setTokenUseCaseSpy = SetTokenToKeychainUseCaseSpy()
    
    private lazy var sut = GetTokenUseCase(
        keychainProvider: keychainProviderSpy,
        setTokenUseCase: setTokenUseCaseSpy
    )
    
    func test_execute_whenTokenAlreadyExists_shouldReturnItsValue() {
        keychainProviderSpy.stringToBeReturned = "token"
        
        let expectedToken = sut.execute()
        
        XCTAssertTrue(keychainProviderSpy.stringCalled)
        XCTAssertFalse(setTokenUseCaseSpy.executeCalled)
        XCTAssertEqual(keychainProviderSpy.stringKeyPassed, "access-token")
        XCTAssertEqual(expectedToken, "token")
    }
    
    func test_execute_whenTokenDoesNotExists_shouldSetAndThenReturnItsvalue() {
        let expectedToken = sut.execute()
        
        XCTAssertTrue(keychainProviderSpy.stringCalled)
        XCTAssertTrue(setTokenUseCaseSpy.executeCalled)
        XCTAssertEqual(setTokenUseCaseSpy.keyPassed, "access-token")
        XCTAssertEqual(expectedToken, "z77WD0DUaTynMDfNxqiUKGtC4k0w2IbUBPiOl35EQ9bhgABOxzw")
    }
}
