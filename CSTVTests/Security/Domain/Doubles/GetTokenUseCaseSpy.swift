@testable import CSTV

final class GetTokenUseCaseSpy: GetTokenUseCaseProtocol {
    private(set) var executeCalled: Bool = false
    var executeToBeReturned: String = ""
    
    func execute() -> String {
        executeCalled = true
        return executeToBeReturned
    }
}
