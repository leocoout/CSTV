import UIKit

final class MatchListViewController: UITableViewController {
    
    private var viewModel: MatchListViewModelProtocol
    private let tableViewResponder: MatchListTableViewResponderProtocol
    private let router: MatchListRoutingProtocol
    
    init(
        viewModel: MatchListViewModelProtocol,
        tableViewResponder: MatchListTableViewResponderProtocol,
        router: MatchListRoutingProtocol
    ) {
        self.viewModel = viewModel
        self.tableViewResponder = tableViewResponder
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        tableViewResponder.delegate = self
        self.tableView = tableViewResponder.tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        didUpdateMatchList()
        viewModel.fetchMatches()
    }
}

extension MatchListViewController: MatchListTableViewResponderDelegate {
    func handleMatchSelection(_ matchData: MatchTableViewCell.ViewModel) {
        router.routeToMatchDetails(
            with: .init(
                leftTeam: .init(id: matchData.leftTeam.id),
                rightTeam: .init(id: matchData.rightTeam.id),
                matchTime: matchData.matchStartTime,
                isLive: matchData.isLive,
                leagueSerie: matchData.leagueSerieName
            )
        )
    }
    
    func requestMoreData() {
        viewModel.fetchMatches()
    }
}

private extension MatchListViewController {
    func didUpdateMatchList() {
        viewModel.didUpdateMatchList =  { [weak self ] list in
            self?.tableViewResponder.updateDataSource(
                .init(matches: list.mappedToMatchListCellViewModel)
            )
        }
    }
}
