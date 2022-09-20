protocol MatchListViewModelProtocol {
    func fetchMatches()
    
    var didUpdateMatchList: ((MatchListModel) -> Void)? { get set }
}

final class MatchListViewModel: MatchListViewModelProtocol {
    
    // MARK: - Public Properties
    
    var didUpdateMatchList: ((MatchListModel) -> Void)?
    
    // MARK: - Private Properties
    
    private let getMatchesForPageUseCase: GetMatchesForPageUseCaseProtocol
    private var matches: MatchListModel = []
    
    init(getMatchesForPageUseCase: GetMatchesForPageUseCaseProtocol) {
        self.getMatchesForPageUseCase = getMatchesForPageUseCase
    }
    
    func fetchMatches() {
        getMatchesForPage()
    }
}

private extension MatchListViewModel {
    func getMatchesForPage() {
        Task {
            let list = await getMatchesForPageUseCase.execute()
            switch list {
            case .success(let list):
                let formattedList = list.formatted
                matches.append(contentsOf: formattedList)
                
                didUpdateMatchList?(matches)
            case .failure(let error):
                print(error)
            }
        }
    }
}

private extension Array where Element == Match {
    var formatted: Self {
        map {
            .init(
                status: $0.status,
                opponents: $0.opponents,
                leagueName: $0.leagueName,
                leagueImageUrl: $0.leagueImageUrl,
                serieName: $0.serieName,
                matchStartTime: $0.matchStartTime?.formatToDate() ?? "NÃO INICIADO"
            )
        }
    }
}
