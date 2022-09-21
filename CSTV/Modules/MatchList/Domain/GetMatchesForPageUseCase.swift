import Foundation

protocol GetMatchesForPageUseCaseProtocol {
    func execute() async throws -> [Match]
}

final class GetMatchesForPageUseCase: GetMatchesForPageUseCaseProtocol {
    private let repository: MatchListRepository
    private let currentDate: Date
    
    private var currentPage: Int = 1
    
    init(
        repository: MatchListRepository,
        currentDate: Date = .now
    ) {
        self.repository = repository
        self.currentDate = currentDate
    }
    
    func execute() async throws -> [Match] {
       
        do {
            let result = try await repository.getMatches(for: currentPage)
            incrementPage()
            let mappedResponse = result.map { match in
                let mappedOpponents = match.opponents.map {
                    MatchListOpponent(from: $0)
                }
                
                let mappedGames = match.games.map { game in
                    Match(
                        status: .init(rawValue: game.status.rawValue) ?? .notPlayed,
                        opponents: mappedOpponents,
                        leagueName: match.league.name,
                        leagueImageUrl: match.league.imageUrl,
                        serieName: match.serie.name,
                        matchStartTime: match.beginAt,
                        priority: 0
                    )
                }
                return mappedGames
            }.flatMap { $0 }
            
            return mappedResponse
        } catch {
            throw MatchListError.generic
        }
    }
}

private extension GetMatchesForPageUseCase {
    func incrementPage() {
        currentPage += 1
    }
}
