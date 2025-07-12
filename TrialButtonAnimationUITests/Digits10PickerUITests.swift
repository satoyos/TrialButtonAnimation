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
  
  func testTapFullChangesItToEmpy() {
    // when
    let digitsPage = homePage.gotoDigits10PickerPage()
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
    let theButton = homePage.digits10PickerButton
    XCTAssert(theButton.staticTexts["90首"].exists)
  }

  func testTapEmptyChangesItToFull() {
    // given
    let digitsPage = homePage.gotoDigits10PickerPage()
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
    let theButton = homePage.digits01PickerButton
    XCTAssert(theButton.staticTexts["100首"].exists)
  }
  
  func testTapSeveralCells() {
    // given
    let digitsPage = homePage.gotoDigits10PickerPage()
    XCTAssert(digitsPage.badge(of: 100).exists)
    // when
    digitsPage
      .tapCell(number: 0)
      .tapCell(number: 3)
      .tapCell(number: 4)
      .tapCell(number: 7)
    // then
    XCTAssert(digitsPage.badge(of: 61).exists)
    // when
    digitsPage.backToTopButton.tap()
    let theButton = homePage.digits01PickerButton
    XCTAssert(theButton.staticTexts["61首"].exists)
  }
}
