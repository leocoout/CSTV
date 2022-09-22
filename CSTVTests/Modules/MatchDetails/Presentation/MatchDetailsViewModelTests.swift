import XCTest

@testable import CSTV

final class MatchDetailsViewModelTests: XCTestCase {
    private let dependenciesFixture = MatchDetailsFactory.Dependencies.fixture(
        leftTeam: .fixture(id: 000),
        rightTeam: .fixture(id: 111),
        matchTime: "match time",
        isLive: false,
        leagueSerie: "league serie"
    )
    
    private let getTeamsUseCaseSpy = GetTeamsUseCaseSpy()
    private let dispatchQueueSpy = DispatchQueueSpy()
    
    private lazy var sut = MatchDetailsViewModel(
        depedencies: dependenciesFixture,
        getTeamsUseCase: getTeamsUseCaseSpy,
        dispatchQueueProtocol: dispatchQueueSpy
    )
    
    func test_initialize_shouldPassLoadingState() {
        sut.initialize()
        
        sut.didUpdateListState = {
            XCTAssertEqual($0, .loading)
        }
    }
    
    func test_initialize_shouldCallGetTeamsUseCase() {
        let expectation = expectation(description: "Waiting for mocked response")
        
        sut.initialize()
        expectation.fulfill()
        
        waitForExpectations(timeout: 0.1, handler: nil)
        
        XCTAssertTrue(getTeamsUseCaseSpy.executeCalled)
    }
    
    func test_initialize_getTeams_givenError_shouldReturnErrorState() {
        sut.initialize()
        
        sut.didUpdateListState = {
            XCTAssertEqual($0, .error(message: "Erro ao carregar lista de partidas."))
        }
    }
    
    func test_initialize_getTeams_givenSuccess_shouldReturnContentState() {
        getTeamsUseCaseSpy.executeToBeReturned = [.fixture()]
        
        sut.initialize()
        
        sut.didUpdateListState = {
            XCTAssertEqual($0, .content)
        }
    }
    
    func test_initialize_getTeams_givenSuccess_shouldUpdateMatchDetails() {
        getTeamsUseCaseSpy.executeToBeReturned = [makeMockedLeftTeam, makeMockedRightTeam]
        
        sut.initialize()
        
        sut.didUpdateMatchDetails = {
            XCTAssertEqual($0.header.leftTeam.name, "left team name")
            XCTAssertEqual($0.header.leftTeam.imageUrl, "left team image url")
            XCTAssertEqual($0.header.rightTeam.name, "right team name")
            XCTAssertEqual($0.header.rightTeam.imageUrl, "right team image url")
            
            XCTAssertEqual($0.players.leftTeamPlayers.first?.name, "Leonardo Santos")
            XCTAssertEqual($0.players.rightTeamPlayers.first?.name, "Teste Da silva")
        }
    }
}

private extension MatchDetailsViewModelTests {
    var makeMockedLeftTeam: Team {
        .fixture(
            id: 000,
            name: "left team name",
            imageUrl: "left team image url",
            players: [
                .fixture(
                    firstName: "Leonardo",
                    lastName: "Santos",
                    name: "Leocoout",
                    imageUrl: "image url"
                )
            ]
        )
    }
    
    var makeMockedRightTeam: Team {
        .fixture(
            id: 111,
            name: "right team name",
            imageUrl: "right team image url",
            players: [
                .fixture(
                    firstName: "Teste",
                    lastName: "Da silva",
                    name: "Nickname",
                    imageUrl: "image url"
                )
            ]
        )
    }
}
