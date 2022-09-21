import Cartography
import UIKit

protocol MatchDetailHeaderCellDisplayable: UITableViewCell {
    func configure(with viewModel: MatchDetailHeaderCell.ViewModel)
}

final class MatchDetailHeaderCell: UITableViewCell, MatchDetailHeaderCellDisplayable {
    
    // MARK: - ViewModel
    
    struct ViewModel {
        let matchTime: String
        let isLive: Bool
        let teamsCellModel: MatchCellTeamsView.ViewModel
    }
    
    // MARK: - Private Properties
    
    private let teamsView: MatchCellTeamsViewDisplayable
    
    private lazy var vStack: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [teamsView, matchTimeView])
        vStack.distribution = .fillProportionally
        vStack.alignment = .center
        vStack.axis = .vertical
        vStack.spacing = 12
        return vStack
    }()
    
    private let matchTimeView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var matchTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
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
        matchTimeLabel.text = viewModel.isLive ? "AGORA" : viewModel.matchTime
        matchTimeView.backgroundColor = viewModel.isLive ? .live : .clear
        setupTeamsView(viewModel)
    }
}

extension MatchDetailHeaderCell: ViewCodable {
    func setupSubviews() {
        addSubview(vStack)
        matchTimeView.addSubview(matchTimeLabel)
    }
    
    func setupConstraints() {
        constrain(vStack, self) {
            $0.edges == $1.edges.inseted(by: 22)
        }
        
        constrain(matchTimeLabel, matchTimeView) {
            $0.edges == $1.edges.inseted(by: 12)
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
