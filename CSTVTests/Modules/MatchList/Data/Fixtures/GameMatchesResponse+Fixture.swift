@testable import CSTV

extension MatchesResponse {
    static func fixture(
        id: String? = nil,
        games: [GameResponse] = [],
        serie: SerieResponse = .fixture(),
        league: LeagueResponse = .fixture(),
        opponents: [MatchOpponentResponse] = []
    ) -> Self {
        .init(
            beginAt: id,
            games: games,
            serie: serie,
            league: league,
            opponents: opponents
        )
    }
}


extension GameResponse {
    static func fixture(
        id: Int = 0,
        status: GameResponse.Status = .notPlayed
    ) -> Self {
        .init(
            id: id,
            status: status
        )
    }
}

extension SerieResponse {
    static func fixture(name: String? = nil) -> Self {
        .init(name: name)
    }
}

extension LeagueResponse {
    static func fixture(
        id: Int = 0,
        name: String? = nil,
        imageUrl: String? = nil
    ) -> Self {
        .init(id: id, name: name, imageUrl: imageUrl)
    }
}
extension MatchOpponentResponse {
    static func fixture(
        opponent: OpponentResponse = .fixture(),
        type: OpponentType = .team
    ) -> Self {
        .init(
            opponent: opponent,
            type: type
        )
    }
}

extension OpponentResponse {
    static func fixture(
        id: Int = 0,
        imageUrl: String? = nil,
        name: String? = nil
    ) -> Self {
        .init(
            id: id,
            imageUrl: imageUrl,
            name: name
        )
    }
}
