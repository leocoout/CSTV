extension MatchList {
    init(from response: MatchesResponse) {
        let mappedOpponents = response.opponents.map {
            MatchListOpponent(from: $0)
        }
        
        let status = response.games.first?.status ?? .notPlayed
        let startTime = response.games.first?.beginAt
        
        self = .init(
            id: response.id,
            status: .init(rawValue: status.rawValue) ?? .notPlayed,
            opponents: mappedOpponents,
            leagueName: response.league.name,
            leagueImageUrl: response.league.imageUrl,
            serieName: response.serie.name,
            matchStartTime: startTime
        )
    }
}

extension MatchListOpponent {
    init(from response: MatchOpponentResponse) {
        self = .init(
            id: response.opponent.id,
            imageUrl: response.opponent.imageUrl,
            name: response.opponent.name
        )
    }
}
