import Cartography
import UIKit

protocol MatchDetailPlayerCellDisplayable: UITableViewCell {
    func configure(with viewModel: MatchDetailPlayerCell.ViewModel)
}

final class MatchDetailPlayerCell: UITableViewCell, MatchDetailPlayerCellDisplayable {
    
    // MARK: - ViewModel
    
    struct ViewModel {
        let leftPlayer, rightPlayer: Player
        
        struct Player {
            let nickname: String
            let name, imageUrl: String?
        }
    }
    
    // MARK: - Private Properties
    
    private let leftTeamView: LeftTeamViewDisplayable
    private let rightTeamView: RightTeamViewDisplayable
    
    private lazy var hStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [leftTeamView, rightTeamView])
        hStack.distribution = .fillEqually
        hStack.axis = .horizontal
        hStack.spacing = 14
        return hStack
    }()
    
    // MARK: - Initializer
    
    init(
        leftTeamView: LeftTeamViewDisplayable = LeftTeamView(),
        rightTeamView: RightTeamViewDisplayable = RightTeamView()
    ) {
        self.leftTeamView = leftTeamView
        self.rightTeamView = rightTeamView
        super.init(style: .default, reuseIdentifier: nil)
        
        setup()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.leftTeamView = LeftTeamView()
        self.rightTeamView = RightTeamView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func configure(with viewModel: ViewModel) {
        setupLeftTeamView(viewModel)
        setupRightTeamView(viewModel)
    }
    
    private func setupLeftTeamView(_ viewModel: MatchDetailPlayerCell.ViewModel) {
        leftTeamView.configure(
            with: .init(
                nickname: viewModel.leftPlayer.nickname,
                name: viewModel.leftPlayer.nickname,
                imageUrl: viewModel.leftPlayer.nickname
            )
        )
    }
    
    private func setupRightTeamView(_ viewModel: MatchDetailPlayerCell.ViewModel) {
        rightTeamView.configure(
            with: .init(
                nickname: viewModel.rightPlayer.nickname,
                name: viewModel.rightPlayer.nickname,
                imageUrl: viewModel.rightPlayer.nickname
            )
        )
    }
}

extension MatchDetailPlayerCell: ViewCodable {
    func setupSubviews() {
        addSubview(hStack)
    }
    
    func setupConstraints() {
        constrain(hStack, self) {
            $0.edges == $1.edges
        }
    }
    
    func setupExtraConfigurations() {
        selectionStyle = .none
        backgroundColor = .clear
        clipsToBounds = false
    }
}
