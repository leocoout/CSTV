protocol MatchListViewModelProtocol {
    func initialize()
    func fetchMatches()
    
    var didUpdateMatchList: ((MatchListModel) -> Void)? { get set }
    var didUpdateListState: ((MatchListState) -> Void)? { get set }
}

final class MatchListViewModel: MatchListViewModelProtocol {
    
    // MARK: - Public Properties
    
    var didUpdateMatchList: ((MatchListModel) -> Void)?
    var didUpdateListState: ((MatchListState) -> Void)?
    
    // MARK: - Private Properties
    
    private let getMatchesForPageUseCase: GetMatchesForPageUseCaseProtocol
    private var matches: MatchListModel = []
    
    init(getMatchesForPageUseCase: GetMatchesForPageUseCaseProtocol) {
        self.getMatchesForPageUseCase = getMatchesForPageUseCase
    }
    
    func initialize() {
        didUpdateListState?(.loading)
        getMatchesForPage()
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
                
                didUpdateListState?(.content)
                didUpdateMatchList?(matches)
            case .failure:
                didUpdateListState?(.error(message: "Erro ao carregar lista de partidas."))
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
                matchStartTime: $0.matchStartTime?.formattedToDate ?? "NÃO INICIADO"
            )
        }
    }
}
