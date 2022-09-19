protocol MatchListRoutingProtocol {
    func routeToMatchDetails(with dependencies: MatchDetailsFactory.Dependencies)
}

final class MatchListRouter: MatchListRoutingProtocol {
    weak var viewController: MatchListViewController?
    
    func routeToMatchDetails(with dependencies: MatchDetailsFactory.Dependencies) {
        let view = MatchDetailsFactory().make(with: dependencies)
        
        viewController?.navigationController?.pushViewController(view, animated: true)
    }
}
