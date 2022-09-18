@testable import CSTV

extension PlayerList {
    static func fixture(
        teamId: Int = 0,
        players: [Player] = []
    ) -> Self {
        .init(
            teamId: teamId,
            players: players
        )
    }
}

extension Player {
    static func fixture(
        firstName: String? = nil,
        lastName: String? = nil,
        name: String? = nil,
        imageUrl: String? = nil
    ) -> Self {
        .init(
            firstName: firstName,
            lastName: lastName,
            name: name,
            imageUrl: imageUrl
        )
    }
}
