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
    let digitsPage = homePage.gotoDigits01PickerPage()
    // then
    XCTAssert(digitsPage.exists)
  }
  
  func testTapFullChangesItToEmpy() {
    // when
    let digitsPage = homePage.gotoDigits01PickerPage()
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

  func testTapEmptyChangesItToFull() {
    // given
    let digitsPage = homePage.gotoDigits01PickerPage()
    XCTAssert(digitsPage.badge(of: 100).exists)
    digitsPage.tapCell(number: 2)
    XCTAssert(digitsPage.badge(of: 90).exists)
    // when
    digitsPage.tapCell(number: 2)
    // then
    XCTAssert(digitsPage.badge(of: 100).exists)
    // when
    digitsPage.backToTopButton.tap()
    // then
    let theButton = homePage.digitPicker01Button
    XCTAssert(theButton.staticTexts["100首"].exists)
  }
  
  func testTapSeveralCells() {
    // given
    let digitsPage = homePage.gotoDigits01PickerPage()
    XCTAssert(digitsPage.badge(of: 100).exists)
    // when
    digitsPage
      .tapCell(number: 1)
      .tapCell(number: 3)
      .tapCell(number: 4)
      .tapCell(number: 7)
    // then
    XCTAssert(digitsPage.badge(of: 60).exists)
    // when
    digitsPage.backToTopButton.tap()
    let theButton = homePage.digitPicker01Button
    XCTAssert(theButton.staticTexts["60首"].exists)
  }
}
