struct Team {
    let id: Int
    let name: String
    let imageUrl: String?
    let players: [Player]
}

struct Player {
    let firstName, lastName, name, imageUrl: String?
}
