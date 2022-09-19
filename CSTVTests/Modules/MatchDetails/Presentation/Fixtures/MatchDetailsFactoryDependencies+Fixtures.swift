@testable import CSTV

extension MatchDetailsFactory.Dependencies {
    static func fixture(
        leftTeam: Team = .fixture(),
        rightTeam: Team = .fixture(),
        matchTime: String = "",
        leagueSerie: String = ""
    ) -> Self {
        .init(
            leftTeam: leftTeam,
            rightTeam: rightTeam,
            matchTime: matchTime,
            leagueSerie: leagueSerie
        )
    }
}

extension MatchDetailsFactory.Dependencies.Team {
    static func fixture(imageUrl: String = "", name: String = "") -> Self {
        .init(imageUrl: imageUrl, name: name)
    }
}
