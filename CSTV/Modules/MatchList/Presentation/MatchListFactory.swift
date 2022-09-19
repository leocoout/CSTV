import UIKit

final class MatchListFactory: ModuleFactoryProtocol {
    func make() -> UIViewController {
        let tableViewResponder = MatchListTableViewResponder()
        let viewModel = MatchListViewModel(getMatchesForPageUseCase: GetMatchesForPageUseCaseFactory.make())
        let viewController = MatchListViewController(viewModel: viewModel, tableViewResponder: tableViewResponder)
        
        viewController.title = "Partidas"
        
        return viewController
    }
}
