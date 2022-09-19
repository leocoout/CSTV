import Cartography
import UIKit

final class LoaderTableViewCell: UITableViewCell {
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.color = .gray100
        indicator.startAnimating()
        indicator.hidesWhenStopped = false
        
        constrain(indicator) {
            $0.height == 16
        }
        return indicator
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
}

extension LoaderTableViewCell: ViewCodable {
    func setupSubviews() {
        addSubview(loadingIndicator)
    }
    
    func setupConstraints() {
        constrain(loadingIndicator, self) {
            $0.edges == $1.edges
        }
    }
    
    func setupExtraConfigurations() {
        backgroundColor = .clear
    }
}
