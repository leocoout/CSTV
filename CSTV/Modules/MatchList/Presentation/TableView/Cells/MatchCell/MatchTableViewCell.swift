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
        let leagueSerieName: String
        let matchStartTime: String
        let isLive: Bool
    }
    
    // MARK: - Private Properties
    
    private let teamsView: MatchCellTeamsViewDisplayable
    private let leagueSerieView: MatchCellLeagueSerieViewDisplayable

    private lazy var separatorView: SeparatorView = {
        let view = SeparatorView()
        constrain(view) {
            $0.height == 1
        }
        
        return view
    }()
    
    private lazy var vStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [teamsView, separatorView, leagueSerieView])
        hStack.distribution = .fillProportionally
        hStack.axis = .vertical
        return hStack
    }()
    
    
    // MARK: - Initializer
    
    init(
        teamsView: MatchCellTeamsViewDisplayable = MatchCellTeamsView(),
        leagueSerieView: MatchCellLeagueSerieViewDisplayable = MatchCellLeagueSerieView()
    ) {
        self.teamsView = teamsView
        self.leagueSerieView = leagueSerieView
        super.init(style: .default, reuseIdentifier: nil)
        
        setup()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.teamsView = MatchCellTeamsView()
        self.leagueSerieView = MatchCellLeagueSerieView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }

    func configure(with viewModel: ViewModel) {
        leagueSerieView.configure(with: .init(leagueImageURL: "", leagueAndSerieName: viewModel.leagueSerieName))
        setupTeamsView(viewModel)
    }
}

extension MatchTableViewCell: ViewCodable {
    func setupSubviews() {
        addSubview(vStack)
    }
    
    func setupConstraints() {
        constrain(vStack, self) {
            $0.edges == $1.edges
        }
    }
    
    func setupExtraConfigurations() {
        backgroundColor = .cardColor
    }
}

private extension MatchTableViewCell {
    func setupTeamsView(_ viewModel: MatchTableViewCell.ViewModel) {
        teamsView.configure(
            with: .init(
                leftTeamImage: viewModel.leftTeamImageURL,
                rightTeamImage: viewModel.rightTeamImageURL,
                leftTeamName: viewModel.leftTeamName,
                rightTeamName: viewModel.rightTeamName
            )
        )
    }
}

private class SeparatorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.opacity = 0.2
    }
    
    required init?(coder: NSCoder) { nil }
}
