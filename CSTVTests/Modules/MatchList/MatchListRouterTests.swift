import UIKit
import XCTest

@testable import CSTV

final class MatchListRouterTests: XCTestCase {
    private let navigationSpy = NavigationControllerSpy(rootViewController: UIViewController())
    private let sut = MatchListRouter()
    
    func test_routeToMatchDetails_shouldPresentCorrectScreen() {
        sut.viewController = navigationSpy
        sut.routeToMatchDetails(with: .fixture())
        
        XCTAssertTrue(navigationSpy.pushViewControllerCalled)
    }
}
