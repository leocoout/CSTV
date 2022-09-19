import Cartography
import UIKit

protocol MatchTableViewCellDisplayable: UITableViewCell {
    func configure(with viewModel: MatchTableViewCell.ViewModel)
}

final class MatchTableViewCell: UITableViewCell, MatchTableViewCellDisplayable {
    
    // MARK: - ViewModel
    
    struct ViewModel {
        let leftTeamImageURL, rightTeamImageURL: String
        let leftTeamName, rightTeamName: String
        let leagueImageURL: String
        let leagueName, serieName: String
        let matchStartTime: String
        let isLive: Bool
    }
    
    // MARK: - Private Properties
    
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func configure(with viewModel: ViewModel) {
        <#code#>
    }
}

extension MatchTableViewCell: ViewCodable {
    func setupSubviews() {
        <#code#>
    }
    
    func setupConstraints() {
        <#code#>
    }
}
