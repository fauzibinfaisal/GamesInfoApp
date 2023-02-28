//
//  MainTabBarRouter.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 15/02/23.
//

import UIKit

protocol MainTabBarRouterProtocol {
    func showGameListScreen()
    func showFavoritesScreen()
}

class MainTabBarRouter: MainTabBarRouterProtocol {
    
    weak var viewController: MainTabBarViewController?
    
    init(viewController: MainTabBarViewController) {
        self.viewController = viewController
    }
    
    func showGameListScreen() {
        let homeVC = GameListViewController()
        let homeNC = UINavigationController(rootViewController: homeVC)
        viewController?.present(homeNC, animated: true, completion: nil)
    }
    
    func showFavoritesScreen() {
        let settingsVC = GameFavoriteViewController()
        let settingsNC = UINavigationController(rootViewController: settingsVC)
        viewController?.present(settingsNC, animated: true, completion: nil)
    }
}
