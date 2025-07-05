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
  
  func testTapFullChangesItToEmpy() {
    // when
    let digitsPage = homePage.gotoDigitPickerPage01()
    // then
    XCTAssert(digitsPage.exists)
    XCTAssert(digitsPage.badge(of: 100).exists)
    // when
    digitsPage.tapCell(number: 3)
    // then
    XCTAssert(digitsPage.badge(of: 90).exists)
    // when
    digitsPage.backToTopButton.tap()
    // then
    let theButton = homePage.digitPicker01Button
    XCTAssert(theButton.staticTexts["90首"].exists)
    
  }

}
