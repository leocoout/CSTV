@testable import CSTV

final class TokenRepositorySpy: TokenRepositoryProtocol {
    private(set) var getTokenCalled: Bool = false
    var getTokenToBeReturned: String = ""
    
    func getToken() -> String {
        getTokenCalled = true
        return getTokenToBeReturned
    }
}
