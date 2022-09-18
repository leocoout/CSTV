import Foundation
import NetworkingInterface

final class MatchListRepository {
    private let service: MatchListService
    private let tokenRepository: TokenRepositoryProtocol
    
    init(
        service: MatchListService,
        tokenRepository: TokenRepositoryProtocol
    ) {
        self.service = service
        self.tokenRepository = tokenRepository
    }
    
    func getMatches(for page: Int, beginningAt date: Date) async -> Result<[MatchesResponse], NetworkRequestError> {
        await service.get(
            with: tokenRepository.getToken(),
            page: page,
            begginingAt: date
        )
    }
}
