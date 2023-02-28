//
//  MainTabBarViewController.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 15/02/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    var presenter: MainTabBarPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.setupTabBarView()
    }
    
    private func setupTabBarView(){
        // create child view controllers & Configure the tab bar items with icons
        let homeIcon = UIImage(systemName: "house")
        let homeTabBarItem = UITabBarItem(title: "Home", image: homeIcon, tag: 0)
        let tab1VC = GameListRouter.setupModule()
        tab1VC.title = "Games For You"
        tab1VC.tabBarItem = homeTabBarItem
        let tab1NC = UINavigationController(rootViewController: tab1VC)
        
        let settingsIcon = UIImage(systemName: "heart")
        let settingsTabBarItem = UITabBarItem(title: "Favorite", image: settingsIcon, tag: 1)
        let tab2VC = GameFavoriteRouter.setupModule()
        tab2VC.title = "Favorite Games"
        tab2VC.tabBarItem = settingsTabBarItem
        let tab2NC = UINavigationController(rootViewController: tab2VC)
        
        self.viewControllers = [tab1NC, tab2NC]
        tabBar.tintColor = UIColor(named: "PrimaryColor")
        extendedLayoutIncludesOpaqueBars = true
    }
    
}

extension MainTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        presenter?.didSelectTab(index: tabBarController.selectedIndex)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        presenter?.willSelectTab(index: tabBarController.selectedIndex)
        return true
    }
}
