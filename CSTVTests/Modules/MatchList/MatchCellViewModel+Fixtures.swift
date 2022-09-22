@testable import CSTV

extension MatchTableViewCell.ViewModel {
    static func fixture(
        leftTeam: Team = .fixture(),
        rigthTeam: Team = .fixture(),
        leagueImageURL: String = "",
        leagueSerieName: String = "",
        matchStartTime: String = "",
        isLive: Bool = false
    ) -> Self {
        .init(
            leftTeam: leftTeam,
            rightTeam: rigthTeam,
            leagueImageURL: leagueImageURL,
            leagueSerieName: leagueSerieName,
            matchStartTime: matchStartTime,
            isLive: isLive
        )
    }
}

extension MatchTableViewCell.ViewModel.Team {
    static func fixture(id: Int = 0, imageUrl: String? = nil, name: String = "") -> Self {
        .init(id: id, imageUrl: imageUrl, name: name)
    }
}
