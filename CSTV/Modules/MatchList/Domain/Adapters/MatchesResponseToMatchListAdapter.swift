extension MatchListOpponent {
    init(from response: MatchOpponentResponse) {
        self = .init(
            id: response.opponent.id,
            imageUrl: response.opponent.imageUrl,
            name: response.opponent.name
        )
    }
}
