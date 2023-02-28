//
//  MockGameListPresenter.swift
//  GamesInfoAppTests
//
//  Created by Gop-c2s2-f on 28/02/23.
//

import Foundation
@testable import GamesInfoApp

class MockGameListPresenter: GameListPresenterInterface {
    
    var viewDidAppearCalled = false
    var rowTappedCalled = false
    var getNumberOfRowsCalled = false
    var getGameItemAtCalled = false
    
    func viewDidAppear() {
        viewDidAppearCalled = true
    }
    
    func rowTapped(gameId: Int) {
        rowTappedCalled = true
    }
    
    func getNumberOfRows() -> Int {
        getNumberOfRowsCalled = true
        return 0
    }
    
    func getGameItem(at index: Int) -> GameListEntity {
        getGameItemAtCalled = true
        return GameListEntity(
            id: 3498,
            backgroundImage: "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg",
            name: "Grand Theft Auto V",
            released: "2013-09-17",
            rating: 4.47)
    }
}
