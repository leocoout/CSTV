struct PlayerList {
    let teamId: Int
    let players: [Player]
}

struct Player {
    let firstName, lastName, name, imageUrl: String?
}
