@testable import CSTV

final class SetTokenToKeychainUseCaseSpy: SetTokenToKeychainUseCaseProtocol {
    private(set) var executeCalled: Bool = false
    private(set) var tokenPassed: String?
    private(set) var keyPassed: String?

    func execute(_ token: String, for key: String) {
        executeCalled = true
        tokenPassed = token
        keyPassed = key
    }
}
