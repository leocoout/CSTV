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
        let leftTeam = teams.first {
            $0.id == dependencies.leftTeam.id
        }
        
        let rightTeam = teams.first {
            $0.id == dependencies.rightTeam.id
        }
        
        let matchDetails = MatchDetails(
            header: teamsToMatchDetailsHeader(leftTeam, rightTeam),
            players: teamsToMatchDetailsPlayers(leftTeam, rightTeam)
        )
        
        didUpdateMatchDetails?(matchDetails)
    }
}

extension MatchDetailsViewModel {
    func teamsToMatchDetailsHeader(_ leftTeam: Team?, _ rightTeam: Team?) -> MatchDetailsHeaderModel {
        return .init(
            leftTeam: .init(imageUrl: leftTeam?.imageUrl, name: leftTeam?.name),
            rightTeam: .init(imageUrl: rightTeam?.imageUrl, name: rightTeam?.name),
            matchTime: dependencies.matchTime,
            isLive: dependencies.isLive
        )
    }
    
    func teamsToMatchDetailsPlayers(_ leftTeam: Team?, _ rightTeam: Team?) -> MatchDetailsPlayers {
        let leftTeamPlayers = leftTeam?.players.mapToTeamPlayer ?? []
        let rightTeamPlayers = rightTeam?.players.mapToTeamPlayer ?? []
        
        return .init(
            leftTeamPlayers: leftTeamPlayers,
            rightTeamPlayers: rightTeamPlayers
        )
    }
}

extension Array where Element == Player {
    var mapToTeamPlayer: [MatchDetailsPlayers.TeamPlayer] {
        map { player in
            let fullName = (player.firstName ?? "") + (player.lastName ?? "")
            
            return MatchDetailsPlayers.TeamPlayer(
                nickname: player.name ?? "",
                name: fullName.isEmpty ? nil : fullName,
                imageUrl: player.imageUrl
            )
        }
    }
}
