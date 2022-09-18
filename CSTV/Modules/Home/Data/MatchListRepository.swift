import NetworkingInterface

final class MatchListRepository {
    private let service: GameListService
    private let tokenRepository: TokenRepositoryProtocol
    
    init(
        service: GameListService,
        tokenRepository: TokenRepositoryProtocol
    ) {
        self.service = service
        self.tokenRepository = tokenRepository
    }
    
    func getGameList() async -> Result<[GameMatchesResponse], NetworkRequestError> {
        let request = GetMatchesRequest(tokenHeader: tokenHeader)
        return await service.get(with: request)
    }
    
    func refreshMachesList() async -> Result<[GameMatchesResponse], NetworkRequestError> {
        let request = GetMatchesRequest(tokenHeader: tokenHeader)
        return await service.get(with: request)
    }
}

private extension MatchListRepository {
    var tokenHeader: [String: String] {
        ["authorization": tokenRepository.getToken()]
    }
}
