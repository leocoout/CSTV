import NetworkingInterface

extension TeamError {
    init(from error: NetworkRequestError) {
        self = .generic
    }
}
