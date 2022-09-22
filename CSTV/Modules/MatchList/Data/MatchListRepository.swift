import NetworkingInterface

class MatchListRepository {
    private let service: MatchListService
    private let tokenRepository: TokenRepositoryProtocol
    
    init(
        service: MatchListService,
        tokenRepository: TokenRepositoryProtocol
    ) {
        self.service = service
        self.tokenRepository = tokenRepository
    }
    
    func getMatches(for page: Int) async throws -> [MatchesResponse] {
        await try service.get(
            with: tokenRepository.getToken(),
            page: page
        )
    }
}
