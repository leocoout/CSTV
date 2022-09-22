import XCTest

@testable import CSTV

final class MatchListViewModelTests: XCTestCase {
    
    private let getMatchesForPageSpy = GetMatchesForPageUseCaseSpy()
    private let dispatchQueueSpy = DispatchQueueSpy()
    private let matchDateFormatterSpy = MatchDateFormatterSpy()
    
    private lazy var sut: MatchListViewModel = MatchListViewModel(
        getMatchesForPageUseCase: getMatchesForPageSpy,
        matchDateFormatter: matchDateFormatterSpy,
        dispatchQueueProtocol: dispatchQueueSpy
    )
    
    override func setUp() {
        super.setUp()
        sut.didUpdateListState = nil
    }
    
    func test_getMatches_givenError_shouldReturnErrorState() {
        sut.initialize()
        
        sut.didUpdateListState = {
            XCTAssertEqual($0, .error(message: "Erro ao carregar lista de partidas."))
        }
    }
    func test_initialize_getMachesForPage_givenSuccess_shouldReturnContentState() {
        getMatchesForPageSpy.executeToBeReturned = [.fixture()]
        
        sut.initialize()
        
        sut.didUpdateListState = {
            XCTAssertEqual($0, .content)
        }
    }
    
    func test_initialize_getMactchesForPage_givenSuccess__shouldUpdateMatchDetails() {
        getMatchesForPageSpy.executeToBeReturned = [
            .fixture(
                status: .running,
                opponents: [.fixture(name: "opponent")],
                leagueName: "league",
                leagueImageUrl: "league url",
                serieName: "serie",
                matchStartTime: "",
                priority: 0
            )
        ]
        
        sut.initialize()
        
        sut.didUpdateMatchList = {
            let match = $0.first
            XCTAssertEqual(match?.status, .running)
            XCTAssertEqual(match?.opponents.first?.name, "opponent")
            XCTAssertEqual(match?.leagueName, "league")
            XCTAssertEqual(match?.leagueImageUrl, "league url")
            XCTAssertEqual(match?.serieName, "serie")
            XCTAssertEqual(match?.matchStartTime, "NÃO INICIADO")
            XCTAssertEqual(match?.priority, 1)
        }
    }
}
