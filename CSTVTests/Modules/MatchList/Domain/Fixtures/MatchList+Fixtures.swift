@testable import CSTV

extension Match {
    static func fixture(
        status: Status = .notPlayed,
        opponents: [MatchListOpponent] = [],
        leagueName: String? = nil,
        leagueImageUrl: String? = nil,
        serieName: String? = nil,
        matchStartTime: String? = nil,
        priority: Int = 0
    ) -> Self {
        .init(
            status: status,
            opponents: opponents,
            leagueName: leagueName,
            leagueImageUrl: leagueImageUrl,
            serieName: serieName,
            matchStartTime: matchStartTime,
            priority: priority
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
