protocol GetTeamsUseCaseProtocol {
    func execute(teamA: Int, teamB: Int) async throws -> [Team]
}

final class GetTeamsUseCase: GetTeamsUseCaseProtocol {
    private let repository: TeamsRepository
    
    init(repository: TeamsRepository) {
        self.repository = repository
    }
    
    func execute(teamA: Int, teamB: Int) async throws ->[Team] {
        do {
            let result = try await repository.getPlayers(firstTeamId: teamA, secondTeamId: teamB)
            let mappedResponse = result.map { Team(from: $0) }
            return mappedResponse
        } catch {
            throw TeamError.generic
        }
    }
}
