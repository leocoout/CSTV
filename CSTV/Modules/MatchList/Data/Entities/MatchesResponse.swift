struct MatchesResponse: Codable {
    let id: Int
    let games: [MatchResponse]
    let serie: MatchSerieResponse
    let league: MatchLeagueResponse
    let opponents: [MatchOpponentResponse]
}

struct MatchResponse: Codable {
    let id: Int
    let status: String
    let beginAt, endAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, status
        case beginAt = "begin_at"
        case endAt = "end_at"
    }
    
    enum Status: String, Codable {
        case finished
        case notPlayed = "not_played"
        case notStarted = "not_started"
        case running
    }
}

struct MatchLeagueResponse: Codable {
    let id: Int
    let name: String?
}

struct MatchSerieResponse: Codable {
    let name: String?
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
