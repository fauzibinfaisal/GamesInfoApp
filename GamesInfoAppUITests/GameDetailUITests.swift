
//
//  GameDetailUITests.swift
//  GamesInfoAppUITests
//
//  Created by Gop-c2s2-f on 28/02/23.
//

import XCTest

final class GameDetailUITests: XCTestCase {

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        app.tables/*@START_MENU_TOKEN@*/.staticTexts["The Witcher 3: Wild Hunt"]/*[[".cells.staticTexts[\"The Witcher 3: Wild Hunt\"]",".staticTexts[\"The Witcher 3: Wild Hunt\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let element = app.scrollViews.children(matching: .other).element(boundBy: 0)
        element.tap()
        element.children(matching: .other).element(boundBy: 5).swipeUp()
        
        let detailNavigationBar = app.navigationBars["Detail"]
        detailNavigationBar.buttons["favorite"].tap()
        detailNavigationBar.buttons["Games For You"].tap()
                
    }

}
