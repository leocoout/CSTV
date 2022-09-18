@testable import CSTV

final class MatchListViewModelSpy: MatchListViewModelProtocol {
    var delegate: CSTV.ViewModelDelegate?
    
    private(set) var initializeCalled: Bool = false
    
    func initialize() {
        initializeCalled = true
    }
}
