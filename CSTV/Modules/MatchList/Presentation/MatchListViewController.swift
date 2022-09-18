import UIKit

final class MatchListViewController: UIViewController {
    
    private var viewModel: MatchListViewModelProtocol
    
    init(viewModel: MatchListViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.initialize()
        
        didUpdateMatchList()
    }
}

private extension MatchListViewController {
    func didUpdateMatchList() {
        viewModel.didUpdateMatchList =  { list in
            print(list)
        }
    }
}
