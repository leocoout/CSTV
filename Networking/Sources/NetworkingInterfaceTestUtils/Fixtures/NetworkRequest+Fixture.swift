import NetworkingInterface

public struct NetworkRequestFixture: NetworkRequest {
    public let scheme: String
    public let baseUrl: String
    public let path: String
    public let method: NetworkRequestMethod
    public let header: [String: String]?
    public let body: [String: String]?
    
    public init(
        scheme: String = "https",
        baseUrl: String = "url.com",
        path: String = "path",
        method: NetworkRequestMethod = .post,
        header: [String : String]? = nil,
        body: [String : String]? = nil
    ) {
        self.scheme = scheme
        self.baseUrl = baseUrl
        self.path = path
        self.method = method
        self.header = header
        self.body = body
    }
}
