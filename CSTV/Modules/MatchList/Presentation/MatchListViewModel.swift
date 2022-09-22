import Foundation

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
    private let matchDateFormatter: MatchDateFormatterProtocol
    private let dispatchQueueProtocol: DispatchQueueProtocol
    
    private var matches: MatchListModel = []
    
    init(
        getMatchesForPageUseCase: GetMatchesForPageUseCaseProtocol,
        matchDateFormatter: MatchDateFormatterProtocol,
        dispatchQueueProtocol: DispatchQueueProtocol = DispatchQueue.main
    ) {
        self.dispatchQueueProtocol = dispatchQueueProtocol
        self.matchDateFormatter = matchDateFormatter
        self.getMatchesForPageUseCase = getMatchesForPageUseCase
    }
    
    func initialize() {
        dispatchQueueProtocol.async(group: nil, qos: .unspecified, flags: .noQoS) { [weak self] in
            self?.didUpdateListState?(.loading)
        }
        getMatchesForPage()
    }
    
    func fetchMatches() {
        getMatchesForPage()
    }
}

private extension MatchListViewModel {
    func getMatchesForPage() {
        Task {
            do {
                let list = try await getMatchesForPageUseCase.execute()
                let formattedList = format(list)
                matches.append(contentsOf: formattedList)
                
                didUpdateListState?(.content)
                didUpdateMatchList?(matches)
            } catch {
                didUpdateListState?(.error(message: "Erro ao carregar lista de partidas."))
            }
        }
    }
    
    func format(_ maches: [Match]) -> MatchListModel {
        maches.map {
            .init(
                status: $0.status,
                opponents: $0.opponents,
                leagueName: $0.leagueName,
                leagueImageUrl: $0.leagueImageUrl,
                serieName: $0.serieName,
                matchStartTime: matchDateFormatter.format($0.matchStartTime) ?? "NÃO INICIADO",
                priority: $0.status == .running ? 1 : 0
            )
        }.sorted { $0.priority > $1.priority }
    }
}
