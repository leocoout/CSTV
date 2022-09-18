extension PlayerList {
    init(from response: TeamResponse) {
        let mappedPlayers = response.players.map { Player(from: $0) }
        
        self = .init(
            teamId: response.id,
            players: mappedPlayers
        )
    }
}

extension Player {
    init(from response: PlayerResponse) {
        self = .init(
            firstName: response.firstName,
            lastName: response.lastName,
            name: response.name,
            imageUrl: response.imageUrl
        )
    }
}
