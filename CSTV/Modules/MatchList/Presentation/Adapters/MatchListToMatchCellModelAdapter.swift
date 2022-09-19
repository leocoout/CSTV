extension Array where Element == Match {
    var mappedToMatchListCellViewModel: [MatchTableViewCell.ViewModel] {
        map { .init(from: $0) }
    }
}

extension MatchTableViewCell.ViewModel {
    init(from list: Match) {
        let leftTeam = list.opponents.first
        let rightTeam = list.opponents.last
        let leagueName = list.leagueName ?? ""
        let serieName = list.serieName ?? ""
        
        self = .init(
            leftTeamImageURL: leftTeam?.imageUrl ?? "",
            rightTeamImageURL: rightTeam?.imageUrl ?? "",
            leftTeamName: leftTeam?.name ?? "",
            rightTeamName: rightTeam?.name ?? "",
            leagueImageURL: list.leagueImageUrl ?? "",
            leagueSerieName: "\(leagueName) + \(serieName)",
            matchStartTime: list.matchStartTime ?? "",
            isLive: list.status == .running
        )
    }
}
