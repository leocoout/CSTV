@testable import CSTV

extension MatchesResponse {
    static func fixture(
        id: Int = 0,
        games: [MatchResponse] = [],
        serie: MatchSerieResponse = .fixture(),
        league: MatchLeagueResponse = .fixture(),
        opponents: [MatchOpponentResponse] = []
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


extension MatchResponse {
    static func fixture(
        id: Int = 0,
        status: MatchResponse.Status = .notPlayed,
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

extension MatchSerieResponse {
    static func fixture(name: String? = nil) -> Self {
        .init(name: name)
    }
}

extension MatchLeagueResponse {
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
