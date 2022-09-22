import UIKit

final class MatchDetailsViewController: UITableViewController {
    private var viewModel: MatchDetailsViewModelProtocol
    private let tableViewResponder: MatchDetailsTableViewResponderProtocol
    private let activityIndicator: UIActivityIndicatorView
    private let errorViewDisplayable: ErrorViewDisplayable
    
    // MARK: - Initializer
    
    init(
        viewModel: MatchDetailsViewModelProtocol,
        tableViewResponder: MatchDetailsTableViewResponderProtocol,
        errorViewDisplayable: ErrorViewDisplayable = ErrorView(),
        activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    ) {
        self.viewModel = viewModel
        self.tableViewResponder = tableViewResponder
        self.errorViewDisplayable = errorViewDisplayable
        self.activityIndicator = activityIndicator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        tableView = tableViewResponder.tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.color = .gray100
        view.backgroundColor = .background
        navigationItem.largeTitleDisplayMode = .never
        updateListState()
        updateDataSource()
        viewModel.initialize()
    }
}

private extension MatchDetailsViewController {
    func updateDataSource() {
        viewModel.didUpdateMatchDetails = { [weak self] details in
            let teamsCellModel = MatchCellTeamsView.ViewModel(
                leftTeamImage: details.header.leftTeam.imageUrl,
                rightTeamImage: details.header.rightTeam.imageUrl,
                leftTeamName: details.header.leftTeam.name,
                rightTeamName: details.header.rightTeam.name
            )
            
            let header = MatchDetailHeaderCell.ViewModel(
                matchTime: details.header.matchTime,
                isLive: details.header.isLive,
                teamsCellModel: teamsCellModel
            )
            
            let leftPlayers = details.players.leftTeamPlayers.map {
                MatchDetailPlayerCell.ViewModel.Player(
                    nickname: $0.nickname,
                    name: $0.name,
                    imageUrl: $0.imageUrl
                )
            }
            
            let rightPlayers = details.players.rightTeamPlayers.map {
                MatchDetailPlayerCell.ViewModel.Player(
                    nickname: $0.nickname,
                    name: $0.name,
                    imageUrl: $0.imageUrl
                )
            }
            
            self?.tableViewResponder.updateDataSource(
                .init(
                    header: header,
                    leftPlayers: leftPlayers,
                    rightPlayers: rightPlayers
                )
            )
        }
    }
    
    func updateListState() {
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
