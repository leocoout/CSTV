import UIKit

final class MatchListViewController: UITableViewController {
    
    private var viewModel: MatchListViewModelProtocol
    private let tableViewResponder: MatchListTableViewResponderProtocol
    private let router: MatchListRoutingProtocol
    private let activityIndicator: UIActivityIndicatorView
    private let errorViewDisplayable: ErrorViewDisplayable
    
    init(
        viewModel: MatchListViewModelProtocol,
        tableViewResponder: MatchListTableViewResponderProtocol,
        router: MatchListRoutingProtocol,
        errorViewDisplayable: ErrorViewDisplayable = ErrorView(),
        activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    ) {
        self.viewModel = viewModel
        self.tableViewResponder = tableViewResponder
        self.router = router
        self.errorViewDisplayable = errorViewDisplayable
        self.activityIndicator = activityIndicator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        tableViewResponder.delegate = self
        tableView = tableViewResponder.tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        didUpdateMatchList()
        didUpdateListState()
        viewModel.initialize()
    }
    
    private func setupLayout() {
        activityIndicator.color = .gray100
        view.backgroundColor = .background
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
        viewModel.didUpdateMatchList =  { [weak self] list in
            self?.tableViewResponder.updateDataSource(
                .init(matches: list.mappedToMatchListCellViewModel)
            )
        }
    }
    
    func didUpdateListState() {
        viewModel.didUpdateListState = { [weak self] state in
            switch state {
            case .loading:
                self?.activityIndicator.startAnimating()
                self?.tableViewResponder.setBackgroundView(self?.activityIndicator)
            case .content:
                self?.tableViewResponder.setBackgroundView(nil)
            case .error(let message):
                self?.errorViewDisplayable.configure(with: .init(message: message))
                self?.tableViewResponder.setBackgroundView(self?.errorViewDisplayable)
            }
        }
    }
}
