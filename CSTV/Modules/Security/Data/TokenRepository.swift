protocol TokenRepositoryProtocol {
    func getToken() -> String
}

final class TokenRepository: TokenRepositoryProtocol {
    
    // MARK: - Private Properties
    
    private enum Constants {
        static let token: String = "Bearer z77WD0DUaTynMDfNxqiUKGtC4k0w2IbUBPiOl35EQ9bhgABOxzw"
        static let key: String = "access-token"
    }
    
    private let keychainProvider: KeychainProviderProtocol
    
    init(keychainProvider: KeychainProviderProtocol) {
        self.keychainProvider = keychainProvider
    }
    
    func getToken() -> String {
        do {
            return try keychainProvider.string(forKey: Constants.key)
        } catch {
            setToken()
        }
        
        return Constants.token
    }
}

private extension TokenRepository {
    func setToken() {
        do { try? keychainProvider.set(Constants.token, forKey: Constants.key) }
    }
}
