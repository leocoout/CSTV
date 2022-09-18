protocol MatchListViewModelProtocol {
    func initialize()
    
    var didUpdateMatchList: ((MatchListModel) -> Void)? { get set }
}

final class MatchListViewModel: MatchListViewModelProtocol {
    
    // MARK: - Public Properties
    
    var didUpdateMatchList: ((MatchListModel) -> Void)?
    
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
                 didUpdateMatchList?(list)
            case .failure(let error):
                print(error)
            }
        }
    }
}