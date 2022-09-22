struct MatchDetails: Equatable {
    let header: MatchDetailsHeaderModel
    let players: MatchDetailsPlayers
}

struct MatchDetailsHeaderModel: Equatable {
    let leftTeam, rightTeam: TeamBanner
    let matchTime: String
    let isLive: Bool
    
    struct TeamBanner: Equatable {
        let imageUrl, name: String?
    }
}

struct MatchDetailsPlayers: Equatable {
    let leftTeamPlayers, rightTeamPlayers: [TeamPlayer]
    
    struct TeamPlayer: Equatable {
        let nickname: String
        let name, imageUrl: String?
    }
}

enum MatchDetailsListState: Equatable {
    case loading, error(message: String), content
}
