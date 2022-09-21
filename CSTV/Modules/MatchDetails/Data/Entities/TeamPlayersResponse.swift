struct TeamResponse: Codable {
    let id: Int
    let imageUrl: String?
    let name: String
    let players: [PlayerResponse]
    
    enum CodingKeys: String, CodingKey {
        case id, name, players
        case imageUrl = "image_url"
    }
}

struct PlayerResponse: Codable {
    let firstName, lastName, name: String?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageUrl = "image_url"
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
