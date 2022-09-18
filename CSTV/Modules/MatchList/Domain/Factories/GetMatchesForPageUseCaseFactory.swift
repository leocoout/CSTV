import Networking
import SimpleKeychain

final class GetMatchesForPageUseCaseFactory {
    static func make() -> GetMatchesForPageUseCaseProtocol {
        let repository = MatchListRepository(
            service: MatchListService(networking: NetworkingFactory().make()),
            tokenRepository: TokenRepository(keychainProvider: SimpleKeychain())
        )
        
        return GetMatchesForPageUseCase(
            repository: repository
        )
    }
}
