import XCTest

@testable import CSTV

final class MatchListViewModelTests: XCTestCase {
    
    private let delegateSpy = ViewModelDelegateSpy()
    private lazy var sut: MatchListViewModel = {
        let sut = MatchListViewModel()
        sut.delegate = delegateSpy
    }()
}
