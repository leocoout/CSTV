import UIKit

@testable import CSTV

final class MatchListTableViewResponderSpy: NSObject, MatchListTableViewResponderProtocol {
    var tableView: UITableView?
    
    var delegate: CSTV.MatchListTableViewResponderDelegate?
    
    func updateDataSource(_ dataSource: CSTV.MatchListTableViewDataSource) {}
    
    func setErrorView(_ view: UIView) {}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 0 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { UITableViewCell() }
}
