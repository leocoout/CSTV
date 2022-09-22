import UIKit
import XCTest

@testable import CSTV

final class MatchDetailsTableViewResponderTests: XCTestCase {
    private let dispatchQueueSpy = DispatchQueueSpy()
    private lazy var sut = MatchDetailsTableViewResponder(
        dispatchQueue: dispatchQueueSpy
    )
    
    func test_updateDataSource_shouldReturCorrectNumberOfRowsForSection() {
        XCTAssertEqual(sut.tableView(UITableView(), numberOfRowsInSection: 0), 0)
        
        sut.updateDataSource(.fixture(
            header: .fixture(),
            leftPlayers: [.fixture()],
            rightPlayers: [.fixture()]
        ))
        
        XCTAssertEqual(sut.tableView(UITableView(), numberOfRowsInSection: 0), 1)
        XCTAssertEqual(sut.tableView(UITableView(), numberOfRowsInSection: 1), 1)
    }
    
    func test_updateDataSource_withoutDataSource_shouldReturCorrectNumberOfRowsForSection() {
        XCTAssertEqual(sut.tableView(UITableView(), numberOfRowsInSection: 0), 0)
        
        sut.updateDataSource(nil)
        
        XCTAssertEqual(sut.tableView(UITableView(), numberOfRowsInSection: 0), 0)
        XCTAssertEqual(sut.tableView(UITableView(), numberOfRowsInSection: 1), 0)
    }
    
    func test_numberOfSections_shouldBeTwo() {
        let expectedNumberOfSections = sut.numberOfSections(in: UITableView())

        XCTAssertEqual(expectedNumberOfSections, 2)
    }

    func test_cellForRowAt_shouldReturnMatchDetailHeaderCell() {
        sut.updateDataSource(.fixture())

        let tableView = UITableView()
        tableView.register(MatchDetailHeaderCell.self)

        let expectedCell = sut.tableView(
            tableView,
            cellForRowAt: IndexPath(row: 0, section: 0)
        )

        XCTAssertTrue(expectedCell is MatchDetailHeaderCell)
        XCTAssertFalse(expectedCell is MatchDetailPlayerCell)
    }
    
    func test_cellForRowAt_shouldReturnMatchDetailPlayerCell() {
        sut.updateDataSource(
            .fixture(
                leftPlayers: [.fixture()],
                rightPlayers: [.fixture()]
            )
        )

        let tableView = UITableView()
        tableView.register(MatchDetailPlayerCell.self)

        let expectedCell = sut.tableView(
            tableView,
            cellForRowAt: IndexPath(row: 0, section: 1)
        )

        XCTAssertFalse(expectedCell is MatchDetailHeaderCell)
        XCTAssertTrue(expectedCell is MatchDetailPlayerCell)
    }

    // MARK: - setBackgroundView

    func test_setBackgroundView_shouldSetBackgroundView() {
        sut.setBackgroundView(DummyUIView())
        
        XCTAssertEqual(sut.tableView?.backgroundView is DummyUIView, true)
    }
}

private class DummyUIView: UIView {}
