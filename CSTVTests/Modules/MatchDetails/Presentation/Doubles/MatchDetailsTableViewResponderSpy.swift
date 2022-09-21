import UIKit

@testable import CSTV

final class MatchDetailsTableViewResponderSpy: NSObject, MatchDetailsTableViewResponderProtocol {
    var tableView: UITableView?
    
    private(set) var updateDataSourceCalled: Bool = false
    private(set) var updateDataSourcePassed: MatchDetailsTableViewDataSource?
    
    func updateDataSource(_ dataSource: CSTV.MatchDetailsTableViewDataSource?) {
        updateDataSourceCalled = true
        updateDataSourcePassed = dataSource
    }
    
    func setBackgroundView(_ view: UIView?) {}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
