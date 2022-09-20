struct MatchDetails {
    let header: MatchDetailsHeaderModel
    let players: MatchDetailsPlayers
}

struct MatchDetailsHeaderModel {
    let leftTeam, rightTeam: TeamBanner
    let matchTime: String
    
    struct TeamBanner {
        let imageUrl, name: String?
    }
}

struct MatchDetailsPlayers {
    let leftTeamPlayers, rightTeamPlayers: [TeamPlayer]
    
    struct TeamPlayer {
        let nickname: String
        let name, imageUrl: String?
    }
}
