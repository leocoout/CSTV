@testable import CSTV

final class MatchDetailsViewModelSpy: MatchDetailsViewModelProtocol {
    var didUpdateHeader: ((CSTV.MatchDetailsHeaderModel) -> Void)?

    private(set) var initializeCalled: Bool = false
    
    func initialize() {
        initializeCalled = true
    }
}
