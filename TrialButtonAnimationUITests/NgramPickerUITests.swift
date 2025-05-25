//
//  NgramPickerUITests.swift
//  TrialButtonAnimationUITests
//
//  Created by Yoshifumi Sato on 2025/05/25.
//

import XCTest

final class NgramPickerUITests: XCTestCase {
  let app = XCUIApplication()
  lazy var homePage = HomePage(app: app)
  
  override func setUpWithError() throws {
    continueAfterFailure = false
    app.launchArguments.append("--uitesting")
    app.launch()
  }
  
  func testOpenNgramPicker() {
    // when
    let ngramPage = homePage.gotoNgramPickerPage()
    // then
    XCTAssert(ngramPage.exists)
  }
}
