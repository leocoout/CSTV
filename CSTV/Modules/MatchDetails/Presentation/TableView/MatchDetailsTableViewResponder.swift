import UIKit

protocol MatchDetailsTableViewResponderProtocol: UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView? { get }
    
    func updateDataSource(_ dataSource: MatchDetailsTableViewDataSource?)
    func setBackgroundView(_ view: UIView?)
}

final class MatchDetailsTableViewResponder: NSObject, MatchDetailsTableViewResponderProtocol {
    
    // MARK: - Private Properties
    private let dispatchQueue: DispatchQueueProtocol
    private var tableDataSource: MatchDetailsTableViewDataSource?
    
    lazy var tableView: UITableView? = {
        let tableView = UITableView()
        tableView.allowsMultipleSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MatchDetailHeaderCell.self)
        tableView.register(MatchDetailPlayerCell.self)
        
        return tableView
    }()
    
    // MARK: - Initializer
    
    init(dispatchQueue: DispatchQueueProtocol =  DispatchQueue.main) {
        self.dispatchQueue = dispatchQueue
    }
    
    func updateDataSource(_ dataSource: MatchDetailsTableViewDataSource?) {
        tableDataSource = dataSource
        dispatchQueue.async(group: nil, qos: .unspecified, flags: []) {
            self.tableView?.reloadData()
        }
    }
    
    func setBackgroundView(_ view: UIView?) {
        dispatchQueue.async(group: nil, qos: .unspecified, flags: []) {
            self.tableView?.backgroundView = view
        }
    }
}

// MARK: - UITableViewDataSource

extension MatchDetailsTableViewResponder {
    func numberOfSections(in tableView: UITableView) -> Int { 2 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowsToShow: Int = min(
            tableDataSource?.leftPlayers.count ?? 0,
            tableDataSource?.rightPlayers.count ?? 0
        )
        
        let headerRowsToShow: Int = tableDataSource?.header == nil ? 0 : 1
        
        return section == 0 ? headerRowsToShow : rowsToShow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0,
           let detailCell = tableView.dequeue(type: MatchDetailHeaderCell.self, for: indexPath),
           let configuration = tableDataSource?.header {
            detailCell.configure(with: configuration)
            return detailCell
        } else if let playerCell = tableView.dequeue(type: MatchDetailPlayerCell.self, for: indexPath),
                  let leftPlayer = tableDataSource?.leftPlayers[indexPath.row],
                  let rightPlayer = tableDataSource?.rightPlayers[indexPath.row] {
            
            playerCell.configure(
                with: .init(
                    leftPlayer: leftPlayer,
                    rightPlayer: rightPlayer
                )
            )
            return playerCell
        }
    
        return UITableViewCell()
    }
}
