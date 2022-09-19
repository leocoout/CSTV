extension Array where Element == MatchList {
    var mappedToMatchListCellViewModel: [MatchTableViewCell.ViewModel] {
        map { .init(from: $0) }
    }
}

extension MatchTableViewCell.ViewModel {
    init(from list: MatchList) {
        let leftTeam = list.opponents[0]
        let rightTeam = list.opponents[1]
        let leagueName = list.leagueName ?? ""
        let serieName = list.serieName ?? ""
        
        self = .init(
            leftTeamImageURL: leftTeam.imageUrl ?? "",
            rightTeamImageURL: rightTeam.imageUrl ?? "",
            leftTeamName: leftTeam.name ?? "",
            rightTeamName: rightTeam.name ?? "",
            leagueImageURL: list.leagueImageUrl ?? "",
            leagueSerieName: "\(leagueName) + \(serieName)",
            matchStartTime: list.matchStartTime ?? "",
            isLive: list.status == .running
        )
    }
}
