import UIKit

final class MatchListViewController: UIViewController {
    
    private let viewModel: MatchListViewModelProtocol
    
    init(viewModel: MatchListViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.initialize()
    }
}

extension MatchListViewController: ViewModelDelegate {
    func willLoad() {}
    
    func didLoad() {}
}
