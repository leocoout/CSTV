@testable import CSTV

extension MatchDetailsFactory.Dependencies {
    static func fixture(
        leftTeam: Team = .fixture(),
        rightTeam: Team = .fixture(),
        matchTime: String = "",
        isLive: Bool = false,
        leagueSerie: String = ""
    ) -> Self {
        .init(
            leftTeam: leftTeam,
            rightTeam: rightTeam,
            matchTime: matchTime,
            isLive: isLive,
            leagueSerie: leagueSerie
        )
    }
}

extension MatchDetailsFactory.Dependencies.Team {
    static func fixture(id: Int = 0) -> Self {
        .init(id: id)
    }
}
