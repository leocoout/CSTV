import Cartography
import UIKit

protocol MatchCellTeamsViewDisplayable: UIView {
    func configure(with viewModel: MatchCellTeamsView.ViewModel)
}

final class MatchCellTeamsView: UIView, MatchCellTeamsViewDisplayable {
    
    // MARK: - ViewModel
    
    struct ViewModel {
        let leftTeamImage, rightTeamImage: String?
        let leftTeamName, rightTeamName: String?
    }
    
    // MARK: - Private Properties
    
    private let leftTeam: TeamStackView
    private let rightTeam: TeamStackView
    
    private lazy var hStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [
            UIView(),
            leftTeam, versusLabel,
            rightTeam,
            UIView()
        ])
        
        hStack.distribution = .fillEqually
        hStack.alignment = .center
        hStack.axis = .horizontal
        return hStack
    }()
    
    private lazy var versusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .gray500
        label.text = "vs"
        
        return label
    }()
    
    // MARK: - Initializer
    
    fileprivate init(
        leftTeam: TeamStackView,
        rightTeam: TeamStackView
    ) {
        self.leftTeam = leftTeam
        self.rightTeam = rightTeam
        
        super.init(frame: .zero)
        setup()
    }
    
    override init(frame: CGRect) {
        self.leftTeam = TeamStackView()
        self.rightTeam = TeamStackView()
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func configure(with viewModel: ViewModel) {
        leftTeam.configure(with: .init(imageUrl: viewModel.leftTeamImage, teamName: viewModel.leftTeamName))
        rightTeam.configure(with: .init(imageUrl: viewModel.rightTeamImage, teamName: viewModel.rightTeamName))
    }
}

extension MatchCellTeamsView: ViewCodable {
    func setupSubviews() {
        addSubview(hStack)
    }
    
    func setupConstraints() {
        constrain(hStack, self) {
            $0.edges == $1.edges.inseted(by: 18)
        }
    }
}
