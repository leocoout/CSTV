import Cartography
import UIKit

class TeamStackView: UIStackView {
    
    struct ViewModel {
        let imageUrl, teamName: String
    }
    
    // MARK: - Private Properties
    
    private lazy var teamImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        constrain(image) {
            $0.width == 60
            $0.height == 60
        }
        
        return image
    }()
    
    private lazy var teamLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.textAlignment = .center
        label.textColor = .gray100
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .vertical
        spacing = 10
        alignment = .center
        distribution = .fillProportionally
        
        addArrangedSubview(teamImage)
        addArrangedSubview(teamLabel)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: ViewModel) {
        teamLabel.text = viewModel.teamName
    }
}
