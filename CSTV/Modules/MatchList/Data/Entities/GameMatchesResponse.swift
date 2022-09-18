struct GameMatchesResponse: Codable {
    let id: Int
    let games: [GameResponse]
    let serie: GameSerieResponse
    let league: GameLeagueResponse
    let opponents: [GameOpponentResponse]
}

struct GameResponse: Codable {
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

struct GameLeagueResponse: Codable {
    let id: Int
    let name: String?
}

struct GameSerieResponse: Codable {
    let name: String?
}

struct GameOpponentResponse: Codable {
    let opponent: OpponentResponse
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
