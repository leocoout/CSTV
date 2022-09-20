protocol MatchDetailsViewModelProtocol {
    func initialize()
    
    var didUpdateMatchDetails: ((MatchDetails) -> Void)? { get set }
}

final class MatchDetailsViewModel: MatchDetailsViewModelProtocol {
    
    // MARK: - Public Properties
    
    var didUpdateMatchDetails: ((MatchDetails) -> Void)?
    
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
        getTeams()
    }
}

private extension MatchDetailsViewModel {    
    func getTeams() {
        Task {
            let response = await getTeamsUseCase.execute(
                teamA: dependencies.leftTeam.id,
                teamB: dependencies.rightTeam.id
            )
            
            switch response {
            case .success(let teams):
                handleGetTeamsSuccessResponse(teams)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func handleGetTeamsSuccessResponse(_ teams: [Team]) {
        let matchDetails = MatchDetails(
            header: teamsToMatchDetailsHeader(teams)
        )
        
        didUpdateMatchDetails?(matchDetails)
    }
}

extension MatchDetailsViewModel {
    func teamsToMatchDetailsHeader(_ teams: [Team]) -> MatchDetailsHeaderModel {
        let leftTeam = teams.first {
            $0.id == dependencies.leftTeam.id
        }
        
        let rightTeam = teams.first {
            $0.id == dependencies.rightTeam.id
        }
        
        return .init(
            leftTeam: .init(imageUrl: leftTeam?.imageUrl, name: leftTeam?.name),
            rightTeam: .init(imageUrl: rightTeam?.imageUrl, name: rightTeam?.name),
            matchTime: dependencies.matchTime
        )
    }
}
