import XCTest

@testable import CSTV

final class MatchDetailsViewModelTests: XCTestCase {
    private let dependenciesFixture = MatchDetailsFactory.Dependencies.fixture(
        leftTeam: .init(imageUrl: "left image", name: "left name"),
        rightTeam: .init(imageUrl: "right image", name: "right name"),
        matchTime: "match time"
    )
    
    private lazy var sut = MatchDetailsViewModel(
        depedencies: dependenciesFixture
    )
    
    func test_initialize_shouldNotifyCorrectHeaderData() {
        sut.didUpdateHeader = {
            XCTAssertEqual($0.leftTeam.name, "left name")
            XCTAssertEqual($0.leftTeam.imageUrl, "left image")
            XCTAssertEqual($0.rightTeam.name, "right name")
            XCTAssertEqual($0.rightTeam.imageUrl, "right image")
            XCTAssertEqual($0.matchTime, "match time")
        }
        
        sut.initialize()
    }
}
