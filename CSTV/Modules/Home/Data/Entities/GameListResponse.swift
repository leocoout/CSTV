struct GameListResponse: Codable {
    let id: Int
    let beginAt: String
    let endAt: String
    let serie: GameSerieResponse
    let league: GameLeagueResponse
    let opponents: [GameOpponentResponse]
}

struct GameLeagueResponse: Codable {
    let id: Int
    let name: String
}

struct GameSerieResponse: Codable {
    let name: String
}

struct GameOpponentResponse: Codable {
    let opponent: OpponentResponse
}

struct OpponentResponse: Codable {
    let id: Int
    let imageUrl: String
    let name: String
}
