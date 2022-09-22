import XCTest

@testable import CSTV

final class MatchToMatchCellModelAdapterTests: XCTestCase {
    func test_givenMatch_shouldAdaptCorrectly() {
        let matchCellModel = MatchTableViewCell.ViewModel(from: match)
        
        XCTAssertEqual(matchCellModel?.leftTeam.name, "left")
        XCTAssertEqual(matchCellModel?.rightTeam.name, "right")
        XCTAssertEqual(matchCellModel?.leagueImageURL, "league image url")
        XCTAssertEqual(matchCellModel?.leagueSerieName, "league + serie")
        XCTAssertEqual(matchCellModel?.matchStartTime, "match start time")
        XCTAssertEqual(matchCellModel?.isLive, true)
    }
}

private extension MatchToMatchCellModelAdapterTests {
    var match: Match {
        .fixture(
            status: .running,
            opponents: [
                .fixture(name: "left"),
                .fixture(name: "right")
            ],
            leagueName: "league",
            leagueImageUrl: "league image url",
            serieName: "serie",
            matchStartTime: "match start time",
            priority: 0
        )
    }
}
