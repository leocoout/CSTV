import UIKit

protocol MatchListTableViewResponderDelegate: AnyObject {
    func handleMatchSelection(_ matchData: MatchTableViewCell.ViewModel)
    func requestMoreData()
}

protocol MatchListTableViewResponderProtocol: UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView? { get }
    var delegate: MatchListTableViewResponderDelegate? { get set }
    
    func updateDataSource(_ dataSource: MatchListTableViewDataSource)
    func setErrorView(_ view: UIView)
}

final class MatchListTableViewResponder: NSObject, MatchListTableViewResponderProtocol {
    
    weak var delegate: MatchListTableViewResponderDelegate?
    
    // MARK: - Private Properties
    private let dispatchQueue: DispatchQueueProtocol
    private var tableDataSource: MatchListTableViewDataSource?
    
    lazy var tableView: UITableView? = {
        let tableView = UITableView()
        tableView.allowsMultipleSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MatchTableViewCell.self)
        tableView.register(LoaderTableViewCell.self)
        
        return tableView
    }()
    
    // MARK: - Initializer
    
    init(dispatchQueue: DispatchQueueProtocol =  DispatchQueue.main) {
        self.dispatchQueue = dispatchQueue
    }
    
    func updateDataSource(_ dataSource: MatchListTableViewDataSource) {
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

extension MatchListTableViewResponder {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableDataSource == nil ? 1 : 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return tableDataSource?.matches.count ?? 0
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell?
        
        if indexPath.section == 0,
           let matchCell = tableView.dequeue(type: MatchTableViewCell.self, for: indexPath),
           let configuration = tableDataSource?.matches[indexPath.row] {
           
            matchCell.configure(
                with: .init(
                    leftTeamImageURL: configuration.leftTeamImageURL,
                    rightTeamImageURL: configuration.rightTeamImageURL,
                    leftTeamName: configuration.leftTeamName,
                    rightTeamName: configuration.rightTeamName,
                    leagueImageURL: configuration.leagueImageURL,
                    leagueSerieName: configuration.leagueSerieName,
                    matchStartTime: configuration.matchStartTime,
                    isLive: configuration.isLive
                )
            )
            cell = matchCell
        } else {
            let loaderCell = tableView.dequeue(type: LoaderTableViewCell.self, for: indexPath)
            cell = loaderCell
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let match = tableDataSource?.matches[indexPath.row] {
            delegate?.handleMatchSelection(match)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            delegate?.requestMoreData()
        }
    }
}
