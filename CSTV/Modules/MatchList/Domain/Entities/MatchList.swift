struct MatchList {
    let id: Int
    let status: Status
    let opponents: [MatchListOpponent]
    let leagueName: String?
    let leagueImageUrl: String?
    let serieName: String?
    let matchStartTime: String?
    
    enum Status: String {
        case finished
        case notPlayed = "not_played"
        case notStarted = "not_started"
        case running
    }
}

struct MatchListOpponent {
    let id: Int
    let imageUrl: String?
    let name: String?
}
