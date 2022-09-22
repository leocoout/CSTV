@testable import CSTV

extension MatchCellTeamsView.ViewModel {
    static func fixture(
        leftTeamImage: String? = nil,
        rightTeamImage: String? = nil,
        leftTeamName: String? = nil,
        rightTeamName: String? = nil
    ) -> Self {
        .init(
            leftTeamImage: leftTeamImage,
            rightTeamImage: rightTeamImage,
            leftTeamName: leftTeamName,
            rightTeamName: rightTeamName
        )
    }
}
