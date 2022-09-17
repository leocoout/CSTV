protocol SetTokenToKeychainUseCaseProtocol {
    func execute(_ token: String, for key: String)
}

final class SetTokenToKeychainUseCase: SetTokenToKeychainUseCaseProtocol {
    
    private let keychainProvider: KeychainProviderProtocol
    
    init(keychainProvider: KeychainProviderProtocol) {
        self.keychainProvider = keychainProvider
    }
    
    func execute(_ token: String, for key: String) {
        do {
            try? keychainProvider.set(token, forKey: key)
        }
    }
}
