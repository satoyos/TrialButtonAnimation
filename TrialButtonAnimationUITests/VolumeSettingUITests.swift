//
//  VolumeSettingUITests.swift
//  TrialButtonAnimationUITests
//
//  Created by Yoshifumi Sato on 2025/02/08.
//

import XCTest

final class VolumeSettingUITests: XCTestCase {
  let app = XCUIApplication()

  override func setUpWithError() throws {
    continueAfterFailure = false
    // given
    app.launch()
  }

    
  func testWhenVolumeChangedAndBackToParentViewTheValueGetChanged()  {
    // when
    let cell = app.cells.staticTexts["音量調整"].firstMatch
    // then
    XCTAssert(cell.exists)
    cell.tap()
    // then
    let slider = app.sliders.firstMatch
    XCTAssert(slider.exists)
    // when
    slider.adjust(toNormalizedSliderPosition: 0.50)
    // then 「49」または「50」どちらかが表示されることを許容
    XCTAssert(app.staticTexts[" 49"].exists || app.staticTexts[" 50"].exists)
    // when
    let backButton = app.buttons["トップ"].firstMatch
    backButton.tap()
    // then 「49%」または「50%」どちらかが表示されることを許容
    XCTAssert(app.staticTexts["49%"].exists || app.staticTexts["50%"].exists)
    
  }

}
