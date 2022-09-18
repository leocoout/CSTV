import NetworkingInterface

extension PlayerListError {
    init(from error: NetworkRequestError) {
        self = .generic
    }
}
