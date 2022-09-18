protocol MatchListViewModelProtocol: ViewModel {}

final class MatchListViewModel: MatchListViewModelProtocol {
    weak var delegate: ViewModelDelegate?
    
    func initialize() {}
}
