import Foundation

protocol GetMatchesForPageUseCaseProtocol {
    func execute() async -> Result <[MatchList], MatchListError>
}

final class GetMatchesForPageUseCase: GetMatchesForPageUseCaseProtocol {
    private let repository: MatchListRepository
    private var currentPage: Int = 1
    
    init(repository: MatchListRepository) {
        self.repository = repository
    }
    
    func execute() async -> Result <[MatchList], MatchListError> {
        let result = await repository.getMatches(
            for: currentPage,
            beginningAt: Date.now.getFormattedDate(format: .yyyyMMddTHHmmssZ)
        )
        
        incrementPage()
        
        switch result {
        case .success(let response):
            let mappedResponse = response.map { MatchList(from: $0) }
            return .success(mappedResponse)
        case .failure(let error):
            return .failure(.init(from: error))
        }
    }
}

extension GetMatchesForPageUseCase {
    func incrementPage() {
        currentPage += 1
    }
}
