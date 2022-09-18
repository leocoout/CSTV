@testable import CSTV

extension Team {
    static func fixture(
        id: Int = 0,
        name: String = "",
        imageUrl: String = "",
        players: [Player] = []
    ) -> Self {
        .init(
            id: id,
            name: name,
            imageUrl: imageUrl,
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
