import UIKit

final class MatchDetailsViewController: UITableViewController {
    private var viewModel: MatchDetailsViewModelProtocol
    private let tableViewResponder: MatchDetailsTableViewResponderProtocol
    
    // MARK: - Initializer
    
    init(
        viewModel: MatchDetailsViewModelProtocol,
        tableViewResponder: MatchDetailsTableViewResponderProtocol
    ) {
        self.viewModel = viewModel
        self.tableViewResponder = tableViewResponder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        self.tableView = tableViewResponder.tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .background
        view.backgroundColor = .background
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
      
        
        updateDataSource()
        viewModel.initialize()
    }
}

extension MatchDetailsViewController {
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
}
