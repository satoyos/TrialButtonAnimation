//
//  DigitsPicker01UITests.swift
//  TrialButtonAnimationUITests
//
//  Created by Yoshifumi Sato on 2025/06/28.
//

import XCTest

final class Digits01PickerUITests: XCTestCase {
  let app = XCUIApplication()
  lazy var homePage = HomePage(app: app)
  
  override func setUpWithError() throws {
    continueAfterFailure = false
    app.launchArguments.append("--uitesting")
    app.launch()
  }
   
  func testOpenDigitsPicker() throws {
    // when
    let digitsPage = homePage.gotoDigitPickerPage01()
    // then
    XCTAssert(digitsPage.exists)
  }
  
}
