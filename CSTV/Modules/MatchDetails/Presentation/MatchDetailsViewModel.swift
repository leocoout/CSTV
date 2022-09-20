protocol MatchDetailsViewModelProtocol {
    func initialize()
    
    var didUpdateHeader: ((MatchDetailsHeaderModel) -> Void)? { get set }
}

final class MatchDetailsViewModel: MatchDetailsViewModelProtocol {
    
    // MARK: - Public Properties
    
    var didUpdateHeader: ((MatchDetailsHeaderModel) -> Void)?
    
    // MARK: - Private Properties
    
    private var dependencies: MatchDetailsFactory.Dependencies
    private let getTeamsUseCase: GetTeamsUseCaseProtocol
    
    init(
        depedencies: MatchDetailsFactory.Dependencies,
        getTeamsUseCase: GetTeamsUseCaseProtocol
    ) {
        self.dependencies = depedencies
        self.getTeamsUseCase = getTeamsUseCase
    }
    
    func initialize() {
        updateHeader()
        getTeams()
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
    
    func getTeams() {
        Task {
            let response = await getTeamsUseCase.execute(
                teamA: dependencies.leftTeam.id,
                teamB: dependencies.rightTeam.id
            )
            
            switch response {
            case .success(let teams):
                print(teams)
            case .failure(let error):
                print(error)
            }
        }
    }
}
