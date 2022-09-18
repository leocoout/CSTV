@testable import CSTV

extension GameMatchesResponse {
    static func fixture(
        id: Int = 0,
        games: [GameResponse] = [],
        serie: GameSerieResponse = .fixture(),
        league: GameLeagueResponse = .fixture(),
        opponents: [GameOpponentResponse] = []
    ) -> Self {
        .init(
            id: id,
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
        status: String = "",
        beginAt: String? = nil,
        endAt: String? = nil
    ) -> Self {
        .init(
            id: id,
            status: status,
            beginAt: beginAt,
            endAt: endAt
        )
    }
}

extension GameSerieResponse {
    static func fixture(name: String? = nil) -> Self {
        .init(name: name)
    }
}

extension GameLeagueResponse {
    static func fixture(
        id: Int = 0,
        name: String? = nil
    ) -> Self {
        .init(id: id, name: name)
    }
}
extension GameOpponentResponse {
    static func fixture(opponent: OpponentResponse = .fixture()) -> Self {
        .init(
            opponent: opponent
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
