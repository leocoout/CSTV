@testable import CSTV

final class MatchListViewModelSpy: MatchListViewModelProtocol {
    
    var didUpdateMatchList: ((CSTV.MatchListModel) -> Void)?

    private(set) var initializeCalled: Bool = false
    
    func fetchMatches() {
        initializeCalled = true
    }
}
