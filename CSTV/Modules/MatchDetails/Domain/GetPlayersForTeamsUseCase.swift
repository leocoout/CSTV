protocol GetPlayersForTeamsUseCaseProtocol {
    func execute(teamA: Int, teamB: Int) async -> Result<[PlayerList], PlayerListError>
}

final class GetPlayersForTeamsUseCase: GetPlayersForTeamsUseCaseProtocol {
    private let repository: TeamPlayersRepository
    
    init(repository: TeamPlayersRepository) {
        self.repository = repository
    }
    
    func execute(teamA: Int, teamB: Int) async -> Result<[PlayerList], PlayerListError> {
        let result = await repository.getPlayers(firstTeamId: teamA, secondTeamId: teamB)
        
        switch result {
        case .success(let response):
            let mappedResponse = response.map { PlayerList(from: $0) }
            return .success(mappedResponse)
        case .failure(let error):
            return .failure(.init(from: error))
        }
    }
}
