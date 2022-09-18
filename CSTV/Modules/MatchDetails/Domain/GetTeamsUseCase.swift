protocol GetTeamsUseCaseProtocol {
    func execute(teamA: Int, teamB: Int) async -> Result<[Team], TeamError>
}

final class GetTeamsUseCase: GetTeamsUseCaseProtocol {
    private let repository: TeamsRepository
    
    init(repository: TeamsRepository) {
        self.repository = repository
    }
    
    func execute(teamA: Int, teamB: Int) async -> Result<[Team], TeamError> {
        let result = await repository.getPlayers(firstTeamId: teamA, secondTeamId: teamB)
        
        switch result {
        case .success(let response):
            let mappedResponse = response.map { Team(from: $0) }
            return .success(mappedResponse)
        case .failure(let error):
            return .failure(.init(from: error))
        }
    }
}
