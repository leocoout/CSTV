@testable import CSTV

final class MatchListViewModelSpy: MatchListViewModelProtocol {
  
    var didUpdateListState: ((CSTV.MatchListState) -> Void)?
    var didUpdateMatchList: ((CSTV.MatchListModel) -> Void)?
    
    private(set) var initializeCalled: Bool = false
    
    func initialize() {
        initializeCalled = true
    }

    private(set) var fetchMatchesCalled: Bool = false
    
    func fetchMatches() {
        fetchMatchesCalled = true
    }
}
