import Cartography
import UIKit

protocol MatchDetailHeaderCellDisplayable: UITableViewCell {
    func configure(with viewModel: MatchDetailHeaderCell.ViewModel)
}

final class MatchDetailHeaderCell: UITableViewCell, MatchDetailHeaderCellDisplayable {
    
    // MARK: - ViewModel
    
    struct ViewModel {
        let matchTime: String
        let teamsCellModel: MatchCellTeamsView.ViewModel
    }
    
    // MARK: - Private Properties
    
    private let teamsView: MatchCellTeamsViewDisplayable
    
    private lazy var vStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [teamsView, matchTimeLabel])
        hStack.distribution = .fillProportionally
        hStack.axis = .vertical
        hStack.spacing = 20
        return hStack
    }()
    
    private lazy var matchTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray100
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Initializer
    
    init(teamsView: MatchCellTeamsViewDisplayable = MatchCellTeamsView()) {
        self.teamsView = teamsView
        super.init(style: .default, reuseIdentifier: nil)
        
        setup()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.teamsView = MatchCellTeamsView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }

    func configure(with viewModel: ViewModel) {
        matchTimeLabel.text = viewModel.matchTime
        setupTeamsView(viewModel)
    }
}

extension MatchDetailHeaderCell: ViewCodable {
    func setupSubviews() {
        addSubview(vStack)
    }
    
    func setupConstraints() {
        constrain(vStack, self) {
            $0.edges == $1.edges
        }
    }
    
    func setupExtraConfigurations() {
        selectionStyle = .none
        backgroundColor = .clear
    }
}

private extension MatchDetailHeaderCell {
    func setupTeamsView(_ viewModel: ViewModel) {
        teamsView.configure(
            with: viewModel.teamsCellModel
        )
    }
}
