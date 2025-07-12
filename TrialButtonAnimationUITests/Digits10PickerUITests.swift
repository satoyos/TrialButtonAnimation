//
//  Digits10PickerUITests.swift
//  TrialButtonAnimationUITests
//
//  Created by Yoshifumi Sato on 2025/07/12.
//

import XCTest

final class Digits10PickerUITests: XCTestCase {
  let app = XCUIApplication()
  lazy var homePage = HomePage(app: app)
  
  override func setUpWithError() throws {
    continueAfterFailure = false
    app.launchArguments.append("--uitesting")
    app.launch()
  }
  
  func testOpenDigitsPicker() throws {
    // when
    let digitsPage = homePage.gotoDigits10PickerPage()
    // then
    XCTAssert(digitsPage.exists)
  }

}
