struct MatchesResponse: Codable {
    let beginAt: String?
    let games: [GameResponse]
    let serie: SerieResponse
    let league: LeagueResponse
    let opponents: [MatchOpponentResponse]
    
    enum CodingKeys: String, CodingKey {
        case games, serie, league, opponents
        case beginAt = "begin_at"
    }
}

struct GameResponse: Codable {
    let id: Int
    let status: Status
    
    enum Status: String, Codable {
        case finished
        case notPlayed = "not_played"
        case notStarted = "not_started"
        case running
    }
}

struct LeagueResponse: Codable {
    let id: Int
    let name: String?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case imageUrl = "image_url"
    }
}

struct SerieResponse: Codable {
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "full_name"
    }
}

struct MatchOpponentResponse: Codable {
    let opponent: OpponentResponse
    let type: OpponentType
    
    enum OpponentType: String, Codable {
        case player = "Player"
        case team = "Team"
    }
}

struct OpponentResponse: Codable {
    let id: Int
    let imageUrl: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case imageUrl = "image_url"
    }
}
