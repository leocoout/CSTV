import Cartography
import UIKit

protocol MatchCellLeagueSerieViewDisplayable: UIView {
    func configure(with viewModel: MatchCellLeagueSerieView.ViewModel)
}

final class MatchCellLeagueSerieView: UIView, MatchCellLeagueSerieViewDisplayable {
    
    // MARK: - ViewModel
    
    struct ViewModel {
        let leagueImageURL: String
        let leagueAndSerieName: String
    }
    
    // MARK: - Private Properties
    
    private lazy var hStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [image, titleLabel])
        hStack.distribution = .fillProportionally
        hStack.alignment = .leading
        hStack.axis = .horizontal
        hStack.spacing = 8
        return hStack
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        constrain(image) {
            $0.width == 16
            $0.height == 16
        }
        
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textColor = .gray100
        
        constrain(label) {
            $0.height == 16
        }
        
        return label
    }()
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func configure(with viewModel: ViewModel) {
        titleLabel.text = viewModel.leagueAndSerieName
    }
}

extension MatchCellLeagueSerieView: ViewCodable {
    func setupSubviews() {
        addSubview(hStack)
    }
    
    func setupConstraints() {
        constrain(hStack, self) {
            $0.edges == $1.edges.inseted(horizontally: 16, vertically: 8)
        }
    }
}
