import UIKit

protocol MatchDetailsTableViewResponderProtocol: UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView? { get }
    
    func updateDataSource(_ dataSource: MatchDetailsTableViewDataSource)
    func setErrorView(_ view: UIView)
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
    
    func updateDataSource(_ dataSource: MatchDetailsTableViewDataSource) {
        tableDataSource = dataSource
        dispatchQueue.async(group: nil, qos: .unspecified, flags: []) {
            self.tableView?.reloadData()
        }
    }
    
    func setErrorView(_ view: UIView) {
        dispatchQueue.async(group: nil, qos: .unspecified, flags: []) {
            self.tableView?.backgroundView = view
        }
    }
}

// MARK: - UITableViewDataSource

extension MatchDetailsTableViewResponder {
    func numberOfSections(in tableView: UITableView) -> Int { 2 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0,
           let detailCell = tableView.dequeue(type: MatchDetailHeaderCell.self, for: indexPath),
           let configuration = tableDataSource?.header
        {
            detailCell.configure(with: configuration)
            return detailCell
        } else if let playerCell = tableView.dequeue(type: MatchDetailPlayerCell.self, for: indexPath) {
            
            playerCell.configure(
                with: .init(
                    leftPlayer: .init(nickname: "Teste", name: "Name", imageUrl: ""),
                    rightPlayer: .init(nickname: "Teste 2", name: "Name 2", imageUrl: "")
                )
            )
            return playerCell
        }
    
        return UITableViewCell()
    }
}
