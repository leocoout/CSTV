@testable import CSTV

extension MatchList {
    static func fixture(
        id: Int = 0,
        status: Status = .notPlayed,
        opponents: [MatchListOpponent] = [],
        leagueName: String? = nil,
        leagueImageUrl: String? = nil,
        serieName: String? = nil
    ) -> Self {
        .init(
            id: id,
            status: status,
            opponents: opponents,
            leagueName: leagueName,
            leagueImageUrl: leagueImageUrl,
            serieName: serieName
        )
    }
}

extension MatchListOpponent {
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
