import UIKit

final class MatchListFactory: ModuleFactoryProtocol {
    func make() -> UIViewController {
        
        let viewModel = MatchListViewModel()
        let viewController = MatchListViewController(viewModel: viewModel)
        
        viewModel.delegate = viewController
        
        return viewController
    }
}
