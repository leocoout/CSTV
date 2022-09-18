import XCTest

@testable import CSTV

final class MatchesResponseToMmatchListAdapterTests: XCTestCase {
    private let sut = MatchList(
        from: .fixture(
            id: 0,
            games: [.fixture(status: .finished)],
            serie: .fixture(name: "serie name"),
            league: .fixture(name: "league name", imageUrl: "league image"),
            opponents: [.fixture(), .fixture()]
        )
    )
    
    func test_shouldAdaptPropertiesCorrectly() {
        XCTAssertEqual(sut.id, 0)
        XCTAssertEqual(sut.status, .finished)
        XCTAssertEqual(sut.leagueName, "league name")
        XCTAssertEqual(sut.leagueImageUrl, "league image")
        XCTAssertEqual(sut.serieName, "serie name")
        
        XCTAssertEqual(sut.opponents.count, 2)
    }
}
