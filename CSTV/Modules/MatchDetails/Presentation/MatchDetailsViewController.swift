import UIKit

final class MatchDetailsViewController: UITableViewController {
    private var viewModel: MatchDetailsViewModelProtocol
    
    init(
        viewModel: MatchDetailsViewModelProtocol
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
}
