import Foundation

protocol GetMatchesForPageUseCaseProtocol {
    func execute() async throws -> [Match]
}

final class GetMatchesForPageUseCase: GetMatchesForPageUseCaseProtocol {
    private let repository: MatchListRepository
    private let currentDate: Date
    
    private var currentPage: Int = 1
    
    init(
        repository: MatchListRepository,
        currentDate: Date = .now
    ) {
        self.repository = repository
        self.currentDate = currentDate
    }
    
    func execute() async throws -> [Match] {
        do {
            let result = try await repository.getMatches(for: currentPage)
            incrementPage()
            
            return Match.make(from: result)
        } catch {
            throw MatchListError.generic
        }
    }
}

private extension GetMatchesForPageUseCase {
    func incrementPage() {
        currentPage += 1
    }
}
