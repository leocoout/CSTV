// MARK: - MatchResponse -> Match

extension Match {
    static func make(from response: [MatchesResponse]) -> [Self] {
        response.map { match in
            let mappedOpponents = match.opponents.map {
                MatchListOpponent(from: $0)
            }
            
            let mappedGames = match.games.map { game in
                Match(
                    status: .init(rawValue: game.status.rawValue) ?? .notPlayed,
                    opponents: mappedOpponents,
                    leagueName: match.league.name,
                    leagueImageUrl: match.league.imageUrl,
                    serieName: match.serie.name,
                    matchStartTime: match.beginAt,
                    priority: 0
                )
            }
            return mappedGames
        }.flatMap { $0 }
    }
}

// MARK: - MatchResponse -> MatchListOpponent


extension MatchListOpponent {
    init(from response: MatchOpponentResponse) {
        self = .init(
            id: response.opponent.id,
            imageUrl: response.opponent.imageUrl,
            name: response.opponent.name
        )
    }
}
