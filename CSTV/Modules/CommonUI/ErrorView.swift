import Cartography
import UIKit

protocol ErrorViewDisplayable: UIView {
    func configure(with viewModel: ErrorView.ViewModel)
}

final class ErrorView: UIView, ErrorViewDisplayable {
    
    // MARK: - ViewModel
    
    struct ViewModel {
        let message: String
    }
    
    // MARK: - Properties
    
    private lazy var message: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Displayable
    
    func configure(with viewModel: ErrorView.ViewModel) {
        message.text = viewModel.message
    }
}

extension ErrorView: ViewCodable {
    func setupSubviews() {
        addSubview(message)
    }
    
    func setupConstraints() {
        constrain(message, self) { view, superView in
            view.edges == superView.edges
        }
    }
}
