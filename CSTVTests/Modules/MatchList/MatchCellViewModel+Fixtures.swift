@testable import CSTV

extension MatchTableViewCell.ViewModel {
    static func fixture(
        leftTeamImageURL: String = "",
        rightTeamImageURL: String = "",
        leftTeamName: String = "",
        rightTeamName: String = "",
        leagueImageURL: String = "",
        leagueSerieName: String = "",
        matchStartTime: String = "",
        isLive: Bool = false
    ) -> Self {
        .init(
            leftTeamImageURL: leftTeamImageURL,
            rightTeamImageURL: rightTeamImageURL,
            leftTeamName: leftTeamName,
            rightTeamName: rightTeamName,
            leagueImageURL: leagueImageURL,
            leagueSerieName: leagueSerieName,
            matchStartTime: matchStartTime,
            isLive: isLive
        )
    }
}
