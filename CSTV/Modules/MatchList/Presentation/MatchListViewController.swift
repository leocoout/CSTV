import UIKit

final class MatchListViewController: UITableViewController {
    
    private var viewModel: MatchListViewModelProtocol
    private let tableViewResponder: MatchListTableViewResponderProtocol
    
    init(
        viewModel: MatchListViewModelProtocol,
        tableViewResponder: MatchListTableViewResponderProtocol
    ) {
        self.viewModel = viewModel
        self.tableViewResponder = tableViewResponder
        
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
        
        viewModel.initialize()
        didUpdateMatchList()
    }
}

extension MatchListViewController: MatchListTableViewResponderDelegate {
    func hadleRecipeSelection(at index: Int) {
    
    }
}

private extension MatchListViewController {
    func didUpdateMatchList() {
        viewModel.didUpdateMatchList =  { list in
            print(list)
        }
    }
}
