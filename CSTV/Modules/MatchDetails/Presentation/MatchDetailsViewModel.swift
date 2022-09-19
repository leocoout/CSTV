protocol MatchDetailsViewModelProtocol {
    func initialize()
    
    var didUpdateHeader: ((MatchDetailsHeaderModel) -> Void)? { get set }
}

final class MatchDetailsViewModel: MatchDetailsViewModelProtocol {
    
    // MARK: - Public Properties
    
    var didUpdateHeader: ((MatchDetailsHeaderModel) -> Void)?
    
    // MARK: - Private Properties
    
    private var dependencies: MatchDetailsFactory.Dependencies
    
    init(depedencies: MatchDetailsFactory.Dependencies) {
        self.dependencies = depedencies
    }
    
    func initialize() {
        updateHeader()
    }
}

private extension MatchDetailsViewModel {
    func updateHeader() {
        didUpdateHeader?(
            .init(
                leftTeam: .init(imageUrl: dependencies.leftTeam.imageUrl, name:  dependencies.leftTeam.name),
                rightTeam: .init(imageUrl: dependencies.rightTeam.imageUrl, name:  dependencies.rightTeam.name),
                matchTime: dependencies.matchTime
            )
        )
    }
}
