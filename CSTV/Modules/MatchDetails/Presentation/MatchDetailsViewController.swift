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

        view.backgroundColor = .background
        
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
                rightTeamName: details.header.leftTeam.name
            )
            
            let header = MatchDetailHeaderCell.ViewModel(
                matchTime: details.header.matchTime,
                teamsCellModel: teamsCellModel
            )
            
            self?.tableViewResponder.updateDataSource(
                .init(header: header)
            )
        }
    }
}
