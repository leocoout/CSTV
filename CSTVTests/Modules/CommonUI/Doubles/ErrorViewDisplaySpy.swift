import UIKit

@testable import CSTV

final class ErrorViewDisplayableSpy: UIView, ErrorViewDisplayable {
    
    private(set) var configureCalled: Bool = false
    private(set) var configureViewModelPassed: ErrorView.ViewModel?
    
    func configure(with viewModel: ErrorView.ViewModel) {
        configureCalled = true
        configureViewModelPassed = viewModel
    }
}

