import UIKit

final class MatchDetailsFactory: ModuleFactoryProtocol {
    struct Dependencies {
        let leftTeam, rightTeam: Team
        let matchTime: String
        let isLive: Bool
        let leagueSerie: String
        
        struct Team {
            let id: Int
        }
    }
    
    func make(with dependencies: Dependencies) -> UIViewController {
        
        let tableViewResponder = MatchDetailsTableViewResponder()
        let viewModel = MatchDetailsViewModel(depedencies: dependencies, getTeamsUseCase: GetTeamsUseCaseFactory.make())
        let viewController = MatchDetailsViewController(viewModel: viewModel, tableViewResponder: tableViewResponder)
        
        viewController.title = dependencies.leagueSerie
        
        return viewController
    }
}
