@testable import CSTV

extension MatchDetailsTableViewDataSource {
    static func fixture(
        header: MatchDetailHeaderCell.ViewModel = .fixture(),
        leftPlayers: [MatchDetailPlayerCell.ViewModel.Player] = [],
        rightPlayers: [MatchDetailPlayerCell.ViewModel.Player] = []
    ) -> Self {
        .init(
            header: header,
            leftPlayers: leftPlayers,
            rightPlayers: leftPlayers
        )
    }
}

extension MatchDetailHeaderCell.ViewModel {
    static func fixture(
        matchTime: String = "",
        isLive: Bool = false,
        teamsCellModel: MatchCellTeamsView.ViewModel = .fixture()
    ) -> Self {
        .init(
            matchTime: matchTime,
            isLive: isLive,
            teamsCellModel: teamsCellModel
        )
    }
}

extension MatchDetailPlayerCell.ViewModel.Player {
    static func fixture(
        nickname: String = "",
        name: String? = nil,
        imageUrl: String? = nil
    ) -> Self {
        .init(nickname: nickname, name: name, imageUrl: imageUrl)
    }
}
