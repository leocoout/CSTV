import NetworkingInterface

extension MatchListError {
    init(from error: NetworkRequestError) {
        self = .generic
    }
}
