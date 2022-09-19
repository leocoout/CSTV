@testable import CSTV

final class MatchDetailsViewModelSpy: MatchDetailsViewModelProtocol {

    private(set) var initializeCalled: Bool = false
    
    func initialize() {
        initializeCalled = true
    }
}
