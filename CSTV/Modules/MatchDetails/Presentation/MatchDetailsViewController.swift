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
        
        updateDataSourceHeader()
        viewModel.initialize()
    }
}

extension MatchDetailsViewController {
    func updateDataSourceHeader() {
        viewModel.didUpdateHeader = { [weak self] details in
            let teamsCellModel = MatchCellTeamsView.ViewModel(
                leftTeamImage: details.leftTeam.imageUrl,
                rightTeamImage: details.rightTeam.imageUrl,
                leftTeamName: details.leftTeam.name,
                rightTeamName: details.leftTeam.name
            )
            
            let header = MatchDetailHeaderCell.ViewModel(
                matchTime: details.matchTime,
                teamsCellModel: teamsCellModel
            )
            
            self?.tableViewResponder.updateDataSource(
                .init(header: header)
            )
        }
    }
}
