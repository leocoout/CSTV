import NetworkingInterface

final class GameListRepository {
    private let service: GameListService
    private let tokenRepository: TokenRepositoryProtocol
    
    init(
        service: GameListService,
        tokenRepository: TokenRepositoryProtocol
    ) {
        self.service = service
        self.tokenRepository = tokenRepository
    }
    
    func getGameList() async -> Result<[GameListResponse], NetworkRequestError> {
        let request = GetMatchesRequest()
        return await service.get(with: makeRequestWithToken(request))
    }
}

private extension GameListRepository {
    func makeRequestWithToken(_ request: HomeNetworkRequest) -> HomeNetworkRequest {
        var modifiedRequest = request
        modifiedRequest.header?["authorization"] = tokenRepository.getToken()
        
        return modifiedRequest
    }
}
