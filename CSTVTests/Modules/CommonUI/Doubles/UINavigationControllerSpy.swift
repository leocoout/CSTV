import UIKit

final class NavigationControllerSpy: UINavigationController {
    
    private(set) var pushViewControllerCalled: Bool = false
    private(set) var viewControllerPassed: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewControllerCalled = true
        viewControllerPassed = viewController
    }
}
