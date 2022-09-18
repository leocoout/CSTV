import Foundation

protocol GetMatchesForPageUseCaseProtocol {
    func execute() async -> Result <[MatchList], MatchListError>
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
    
    func execute() async -> Result <[MatchList], MatchListError> {
        let result = await repository.getMatches(
            for: currentPage,
            beginningAt: currentDate.getFormattedDate(format: .yyyyMMddTHHmmssZ)
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

private extension GetMatchesForPageUseCase {
    func incrementPage() {
        currentPage += 1
    }
}
