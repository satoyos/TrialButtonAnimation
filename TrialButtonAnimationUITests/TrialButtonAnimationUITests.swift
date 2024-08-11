//
//  TrialButtonAnimationUITests.swift
//  TrialButtonAnimationUITests
//
//  Created by Yoshifumi Sato on 2024/08/10.
//

import XCTest

final class TrialButtonAnimationUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialUI() {
        // given
        let app = XCUIApplication()
        // when
        app.launch()
        // then
        let waitingForPlayButton = app.buttons["play"].firstMatch
        XCTAssert(waitingForPlayButton.exists)
    }
    
    func testInitWithEnvironmentVariable() {
        // given
        let app = XCUIApplication()
        app.launchEnvironment = ["MEMORIZE_TIME_IN_SEC": "59"]
        // when
        app.launch()
        // then
        XCTAssert(app.staticTexts["59"].exists)
    }
    
    func testWhenPlayButtonTappedItTurnsIntoPauseButton() {
        // given
        let app = XCUIApplication()
        // when
        app.launch()
        // then
        let waitingForPlayButton = app.buttons["play"].firstMatch
        XCTAssert(waitingForPlayButton.exists)
        // when
        waitingForPlayButton.tap()
        // then
        XCTAssert(app.buttons["pause"].exists)
    }

    
}
