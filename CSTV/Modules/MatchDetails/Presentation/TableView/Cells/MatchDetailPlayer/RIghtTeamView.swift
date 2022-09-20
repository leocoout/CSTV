import Cartography
import UIKit

protocol RightTeamViewDisplayable: UIView {
    func configure(with viewModel: RightTeamView.ViewModel)
}

final class RightTeamView: UIView, RightTeamViewDisplayable {
    
    struct ViewModel {
        let nickname, name, imageUrl: String
    }
    
    // MARK: - Private Properties
    
    private lazy var rightPlayerBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .gray900
        view.clipsToBounds = false
        view.addCornerRadius(of: 12, corners: [.layerMinXMinYCorner, .layerMinXMaxYCorner])
        view.clipsToBounds = false
        
        return view
    }()
    
    private lazy var rightPlayerImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray100
        image.layer.cornerRadius = 8
        
        constrain(image) {
            $0.height == 48
            $0.width == 48
        }
        
        return image
    }()
    
    private lazy var vStack: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [nicknameLabel, playerNameLabel])
        vStack.axis = .vertical
        vStack.spacing = 4
        return vStack
    }()
    
    private lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .gray100
        label.textAlignment = .left
        return label
    }()
    
    private lazy var playerNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(red: 0.42, green: 0.42, blue: 0.49, alpha: 1.00)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func configure(with viewModel: ViewModel) {
        nicknameLabel.text = viewModel.nickname
        playerNameLabel.text = viewModel.name
        rightPlayerImageView.loadImage(from: viewModel.imageUrl)
    }
}

extension RightTeamView: ViewCodable {
    func setupSubviews() {
        addSubview(rightPlayerBackground)
        
        rightPlayerBackground.addSubview(vStack)
        rightPlayerBackground.addSubview(rightPlayerImageView)
    }
    
    func setupConstraints() {
        constrain(rightPlayerBackground, self) {
            $0.leading == $1.leading
            $0.trailing == $1.trailing
            $0.top == $1.top + 4
            $0.bottom == $1.bottom - 12
        }
        
        constrain(vStack, rightPlayerBackground, rightPlayerImageView) { stack, background, image in
            stack.leading == image.trailing + 16
            stack.top == background.top + 16
            stack.bottom == background.bottom - 8
            stack.trailing == background.trailing - 16
        }
        
        constrain(rightPlayerImageView, rightPlayerBackground, self) { image, background, superView in
            image.top == superView.top
            image.leading == background.leading + 12
            image.bottom == background.bottom - 8
        }
    }
}
