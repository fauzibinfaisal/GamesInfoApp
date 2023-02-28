//
//  GameListRouterTests.swift
//  GamesInfoAppTests
//
//  Created by Gop-c2s2-f on 28/02/23.
//

import Foundation

import XCTest
@testable import GamesInfoApp

class GameListRouterTests: XCTestCase {
    
    var gameListRouter: GameListRouter!
    var mockGameListViewController : GameListViewController!
    
    override func setUp() {
        super.setUp()
        let navController = UINavigationController(rootViewController: GameListRouter.setupModule())
        mockGameListViewController = navController.topViewController as? GameListViewController
        
    }
    
    func testTopVCIsGameDetailVCWhenPresented() {
        mockGameListViewController.presenter.rowTapped(gameId: 3498)
        if let navController = mockGameListViewController.navigationController,
           let topVC = navController.topViewController {
            print("Navigation stack: \(navController.viewControllers)")
            XCTAssertTrue(topVC is GameListViewController, "Expected top view controller to be GameDetailViewController")
        } else {
            XCTFail("Navigation controller or top view controller is nil")
        }
    }

}
