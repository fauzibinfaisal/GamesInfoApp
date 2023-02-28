//
//  GameListEntityTests.swift
//  GamesInfoAppTests
//
//  Created by Gop-c2s2-f on 28/02/23.
//

import Foundation

import XCTest
@testable import GamesInfoApp

class GameListEntityTests: XCTestCase {
    
    let game = GameListEntity(
        id: 3498,
        backgroundImage: "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg",
        name: "Grand Theft Auto V",
        released: "2013-09-17",
        rating: 4.47)

    func testGameListSetGet() {
        let game = game
        
        XCTAssertEqual(game.id, 3498)
        XCTAssertEqual(game.backgroundImage, "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg")
        XCTAssertEqual(game.name, "Grand Theft Auto V")
        XCTAssertEqual(game.released,"2013-09-17")
        XCTAssertEqual(game.rating, 4.47)
    }
}
