@testable import CSTV

final class MatchDetailsViewModelSpy: MatchDetailsViewModelProtocol {
    
    var didUpdateMatchDetails: ((CSTV.MatchDetails) -> Void)?
    var didUpdateListState: ((CSTV.MatchDetailsListState) -> Void)?

    private(set) var initializeCalled: Bool = false
    
    func initialize() {
        initializeCalled = true
    }
}
