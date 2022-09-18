@testable import CSTV

extension TeamResponse {
    static func fixture(
        id: Int = 0,
        players: [PlayerResponse] = []
    ) -> Self {
        .init(
            id: id,
            players: players
        )
    }
}

extension PlayerResponse {
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
