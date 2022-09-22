import UIKit

final class MatchListFactory: ModuleFactoryProtocol {
    struct Dependencies {}
    
    func make(with dependencies: Dependencies) -> UIViewController {
        let router = MatchListRouter()
        let tableViewResponder = MatchListTableViewResponder()
        let viewModel = MatchListViewModel(
            getMatchesForPageUseCase: GetMatchesForPageUseCaseFactory.make(),
            matchDateFormatter: MatchDateFormatter())
        let viewController = MatchListViewController(
            viewModel: viewModel,
            tableViewResponder: tableViewResponder,
            router: router
        )
        
        viewController.title = "Partidas"
        router.viewController = viewController
        
        return viewController
    }
}
