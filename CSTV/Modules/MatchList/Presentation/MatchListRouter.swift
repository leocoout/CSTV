protocol MatchListRoutingProtocol {
    func routeToMatchDetails()
}

final class MatchListRouter: MatchListRoutingProtocol {
    weak var viewController: MatchListViewController?
    
    func routeToMatchDetails() {
        let view = MatchDetailsFactory().make(with: .init())
        
        viewController?.navigationController?.pushViewController(view, animated: true)
    }
}
