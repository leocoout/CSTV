@testable import CSTV

extension MatchListTableViewDataSource {
    static func fixture(
        matches: [MatchTableViewCell.ViewModel] = []
    ) -> Self {
        .init(matches: matches)
    }
}
