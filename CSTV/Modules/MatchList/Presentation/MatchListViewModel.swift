protocol MatchListViewModelProtocol: ViewModel {}

final class MatchListViewModel: MatchListViewModelProtocol {
    
    // MARK: - Properties
    weak var delegate: ViewModelDelegate?
    
    // MARK: - Private Properties
    
    private let getMatchesForPageUseCase: GetMatchesForPageUseCaseProtocol
    
    init(getMatchesForPageUseCase: GetMatchesForPageUseCaseProtocol) {
        self.getMatchesForPageUseCase = getMatchesForPageUseCase
    }
    
    func initialize() {
       getMatchesForPage()
    }
}

private extension MatchListViewModel {
    func getMatchesForPage() {
        Task {
            let list = await getMatchesForPageUseCase.execute()
            switch list {
            case .success(let list):
                print(list)
            case .failure(let error):
                print(error)
            }
        }
    }
}
