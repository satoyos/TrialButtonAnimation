//
//  SecTimerWithButtonUITests.swift
//  TrialButtonAnimationUITests
//
//  Created by Yoshifumi Sato on 2024/09/02.
//

import XCTest

final class DurationSettingUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        // given
        app.launch()
    }
    
    func testWhenButtonisTappedCountDownStarts() throws {
        // when
        let cell = app.cells.staticTexts["歌の間隔"].firstMatch
//        XCTAssert(cell.exists)
        cell.tap()
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
    
    func testWhenDurationChangedWithSliderAndBackToParentViewDurationValueGetChanged() {
        // when
        let cell = app.cells.staticTexts["歌の間隔"].firstMatch
        cell.tap()
        // then
        let slider = app.sliders.firstMatch
        XCTAssert(slider.exists)
        // when
        slider.adjust(toNormalizedSliderPosition: 0.00)
        // then
        XCTAssert(app.staticTexts["0.50"].exists)
        // when
        let backButton = app.buttons["Back"]
        backButton.tap()
        // then
        XCTAssert(cell.exists)
        let durationLabel = cell.staticTexts["0.50"]
        XCTAssert(durationLabel.exists)
    }
    
}
