import UIKit

final class MatchDetailsFactory: ModuleFactoryProtocol {
    struct Dependencies {}
    
    func make(with dependencies: Dependencies) -> UIViewController {
        
        let viewModel = MatchDetailsViewModel()
        let viewController = MatchDetailsViewController(viewModel: viewModel)
        
        viewController.title = ""
        
        return viewController
    }
}
