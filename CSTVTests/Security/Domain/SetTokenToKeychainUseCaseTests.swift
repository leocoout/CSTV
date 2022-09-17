import XCTest

@testable import CSTV

final class SetTokenToKeychainUseCaseTests: XCTestCase {
    private let keychainProviderSpy = KeychainProviderSpy()
    private lazy var sut = SetTokenToKeychainUseCase(
        keychainProvider: keychainProviderSpy
    )
    
    func test_execute_shouldSetTokenForKey() {
        sut.execute("test token", for: "test key")
        
        XCTAssertTrue(keychainProviderSpy.setCalled)
        XCTAssertEqual(keychainProviderSpy.setStringPassed, "test token")
        XCTAssertEqual(keychainProviderSpy.setKeyPassed, "test key")
    }
}
