//
//  SceneDelegate.swift
//  CSTV
//
//  Created by Leonardo Coutinho Santos on 17/09/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let matchListController = MatchListFactory().make()
        let navigation = makeNavigation(with: matchListController)
        navigation.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.gray100]
        window.rootViewController = navigation
        self.window = window
        window.makeKeyAndVisible()
    }

    private func makeNavigation(with root: UIViewController?) -> UINavigationController {
        guard let root = root else { return UINavigationController() }
        let navigationController = UINavigationController(rootViewController: root)
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}
