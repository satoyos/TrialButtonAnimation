//
//  SecTimerWithButtonUITests.swift
//  TrialButtonAnimationUITests
//
//  Created by Yoshifumi Sato on 2024/09/02.
//

import XCTest

final class SecTimerWithButtonUITests: XCTestCase {

    override func setUpWithError() throws {
        
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenButtonisTappedCountDownStarts() throws {
        // given
        let app = XCUIApplication()
        app.launch()
        // then
        let slider = app.sliders.firstMatch
        XCTAssert(slider.exists)
        // when
        slider.adjust(toNormalizedSliderPosition: 0.00)
        // then
        XCTAssert(app.staticTexts["0.50"].exists)
        // when
        let button = app.buttons["試しに聞いてみる"]
        XCTAssert(button.exists)
        button.tap()
        // then
        waitToAppear(for: app.staticTexts["0.00"], timeout: 10.0)
    }
}
