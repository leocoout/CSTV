public protocol NetworkingProtocol {
    func request<T: Codable>(
        _ request: NetworkRequest,
        responseModel: T.Type
    ) async -> Result<T, NetworkRequestError>
}
