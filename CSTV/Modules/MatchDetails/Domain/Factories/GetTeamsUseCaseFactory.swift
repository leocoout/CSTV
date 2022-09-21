import Networking
import SimpleKeychain

final class GetTeamsUseCaseFactory {
    static func make() -> GetTeamsUseCaseProtocol {
        let repository = TeamsRepository(
            service: GetTeamsService(networking: NetworkingFactory().make()),
            tokenRepository: TokenRepository(keychainProvider: SimpleKeychain())
        )
        
        return GetTeamsUseCase(
            repository: repository
        )
    }
}
