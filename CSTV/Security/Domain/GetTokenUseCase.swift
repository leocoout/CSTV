protocol GetTokenUseCaseProtocol {
    func execute() -> String
}

final class GetTokenUseCase: GetTokenUseCaseProtocol {
    private let keychainProvider: KeychainProviderProtocol
    private let setTokenUseCase: SetTokenToKeychainUseCaseProtocol
    
    init(
        keychainProvider: KeychainProviderProtocol,
        setTokenUseCase: SetTokenToKeychainUseCaseProtocol
    ) {
        self.keychainProvider = keychainProvider
        self.setTokenUseCase = setTokenUseCase
    }
    
    func execute() -> String {
        do {
            return try keychainProvider.string(forKey: Constants.key)
        } catch {
            setTokenUseCase.execute(Constants.token, for: Constants.key)
        }
        
        return Constants.token
    }
}

private extension GetTokenUseCase {
    enum Constants {
        static let token: String = "z77WD0DUaTynMDfNxqiUKGtC4k0w2IbUBPiOl35EQ9bhgABOxzw"
        static let key: String = "access-token"
    }
}
