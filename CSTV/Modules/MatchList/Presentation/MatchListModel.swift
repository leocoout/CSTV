typealias MatchListModel = [Match]

enum MatchListState: Equatable {
    case loading, content, error(message: String)
}
