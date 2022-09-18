struct TeamResponse: Codable {
    let id: Int
    let players: [PlayerResponse]
}

struct PlayerResponse: Codable {
    let firstName, lastName, name: String
    let imageUrl: String
    
    enum OpponentType: String, Codable {
        case imageUrl = "image_url"
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
