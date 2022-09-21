extension Array where Element == Match {
    var mappedToMatchListCellViewModel: [MatchTableViewCell.ViewModel] {
        compactMap { .init(from: $0) }
    }
}

extension MatchTableViewCell.ViewModel {
    init?(from list: Match) {
        guard let leftTeam = list.opponents.first,
              let rightTeam = list.opponents.last
        else { return nil }
        
        let leagueName = list.leagueName ?? ""
        let serieName = list.serieName ?? ""
        
        self = .init(
            leftTeam: .init(id: leftTeam.id, imageUrl: leftTeam.imageUrl ?? "", name: leftTeam.name ?? ""),
            rightTeam: .init(id: rightTeam.id, imageUrl: rightTeam.imageUrl ?? "", name: rightTeam.name ?? ""),
            leagueImageURL: list.leagueImageUrl ?? "",
            leagueSerieName: "\(leagueName) + \(serieName)",
            matchStartTime: list.matchStartTime ?? "",
            isLive: list.status == .running
        )
    }
}
