//
//  MockGameListViewController.swift
//  GamesInfoAppTests
//
//  Created by Gop-c2s2-f on 28/02/23.
//

import Foundation
@testable import GamesInfoApp

class MockGameListViewController: GameListViewControllerInterface {
    var setupTableViewCalled = false
    var reloadTableViewCalled = false
    
    func setupTableView() {
        setupTableViewCalled = true
    }
    
    func reloadTableView() {
        reloadTableViewCalled = true
    }
}
