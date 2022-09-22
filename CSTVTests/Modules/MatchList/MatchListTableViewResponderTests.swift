import UIKit
import XCTest

@testable import CSTV

final class MatchListTableViewResponderTests: XCTestCase {
    private let dispatchQueueSpy = DispatchQueueSpy()
    private lazy var sut = MatchListTableViewResponder(
        dispatchQueue: dispatchQueueSpy
    )
    
    func test_updateDataSource_shouldReturCorrectNumberOfRows() {
        XCTAssertEqual(sut.tableView(UITableView(), numberOfRowsInSection: 0), 0)
        
        sut.updateDataSource(.fixture(matches: [.fixture(), .fixture()]))
        
        XCTAssertEqual(sut.tableView(UITableView(), numberOfRowsInSection: 0), 2)
        XCTAssertEqual(sut.tableView(UITableView(), numberOfRowsInSection: 1), 1)
    }

    func test_numberOfSections_whenDataSourceIsNil_shouldReturnOne() {
        let expectedNumberOfSections = sut.numberOfSections(in: UITableView())

        XCTAssertEqual(expectedNumberOfSections, 1)
    }
    
    func test_numberOfSections_whenDataSourceIsNotNil_shouldReturnTwo() {
        sut.updateDataSource(.fixture())
        let expectedNumberOfSections = sut.numberOfSections(in: UITableView())
    
        XCTAssertEqual(expectedNumberOfSections, 2)
    }

    func test_cellForRowAt_shouldReturnLoaderCell() {
        sut.updateDataSource(.fixture())

        let tableView = UITableView()
        tableView.register(LoaderTableViewCell.self)

        let expectedCell = sut.tableView(
            tableView,
            cellForRowAt: IndexPath(row: 0, section: 1)
        )

        XCTAssertTrue(expectedCell is LoaderTableViewCell)
        XCTAssertFalse(expectedCell is MatchTableViewCell)
    }
    
    func test_cellForRowAt_shouldReturnMatchTableViewCell() {
        sut.updateDataSource(.fixture(matches: [.fixture()]))

        let tableView = UITableView()
        tableView.register(MatchTableViewCell.self)

        let expectedCell = sut.tableView(
            tableView,
            cellForRowAt: IndexPath(row: 0, section: 0)
        )

        XCTAssertFalse(expectedCell is LoaderTableViewCell)
        XCTAssertTrue(expectedCell is MatchTableViewCell)
    }

    // MARK: - setBackgroundView

    func test_setBackgroundView_shouldSetBackgroundView() {
        sut.setBackgroundView(DummyUIView())
        
        XCTAssertEqual(sut.tableView?.backgroundView is DummyUIView, true)
    }
}

private class DummyUIView: UIView {}
