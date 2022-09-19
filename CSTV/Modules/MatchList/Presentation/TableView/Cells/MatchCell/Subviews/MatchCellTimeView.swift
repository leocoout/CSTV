import Cartography
import UIKit

protocol MatchCellTimeViewDisplayable: UIView {
    func configure(with viewModel: MatchCellTimeView.ViewModel)
}

final class MatchCellTimeView: UIView, MatchCellTimeViewDisplayable {
    
    struct ViewModel {
        let matchTime: String
        let isLive: Bool
    }
    
    // MARK: - Private Properties
    
    private lazy var hStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [UIView(), matchTimeView])
    
        hStack.alignment = .trailing
        hStack.axis = .horizontal
        return hStack
    }()
    
    private lazy var matchTimeView: MatchTimeView = {
        let view = MatchTimeView()
        view.addCornerRadius(of: 16, corners: [.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func configure(with viewModel: ViewModel) {
        matchTimeView.configure(with: viewModel.matchTime, isLive: viewModel.isLive)
    }
}

extension MatchCellTimeView: ViewCodable {
    func setupSubviews() {
        addSubview(hStack)
    }
    
    func setupConstraints() {
        constrain(hStack, self) {
            $0.edges == $1.edges
        }
    }
}

private final class MatchTimeView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray100
        label.font = .systemFont(ofSize: 8, weight: .bold)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    func configure(with title: String, isLive: Bool) {
        titleLabel.text = isLive ? "AGORA" : title
        backgroundColor = isLive ? .live : .gray200
    }
}

extension MatchTimeView: ViewCodable {
    func setupSubviews() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        constrain(titleLabel, self) {
            $0.edges == $1.edges.inseted(by: 8)
        }
    }
}
