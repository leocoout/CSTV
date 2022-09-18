import NetworkingInterface
import Foundation

class MatchListService {
    
    private let networking: NetworkingProtocol
   
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    func get(with token: String, page: Int, begginingAt: Date) async -> Result<[MatchesResponse], NetworkRequestError> {
        let request = GetMatchesRequest(
            token: token,
            requestPage: page,
            beginAt: begginingAt
        )
        return await networking.request(request, responseModel: [MatchesResponse].self)
    }
}