//
//  FiveColorsUITests.swift
//  TrialButtonAnimationUITests
//
//  Created by Yoshifumi Sato on 2025/03/29.
//

@testable import TrialButtonAnimation
import XCTest

class FiveColorsUITest: XCTestCase {

    internal var app = XCUIApplication()
    internal lazy var homePage = HomePage(app: app)
    private let timeOutSec = 8.0
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launchArguments.append("--uitesting")
        app.launch()
    }

  private func gotoFiveColorsPage() {
    homePage.fiveColorsButton.tap()
  }
    
    func test_goto5ColorsScreenWork() {
      // given
      let button = homePage.fiveColorsButton
      // then
      XCTAssert(button.exists)
      // when
      button.tap()
      // then
      let colorPage = FiveColorsPage(app: app)
      XCTAssert(colorPage.exists)
    }
    
    func test_selectJust20ofColor() {
      let colorPage = homePage.gotoFiveColorsPage()
      // then
      XCTAssert(colorPage.exists)
      // when
      let sheet = colorPage.tapColorButton(of: .green)
      // then
      XCTAssert(sheet.exists)
      // when
      sheet.selectOnlyThese20Button.tap()
      // then
      XCTAssert(colorPage.badge(of: 20).exists)
      // when
      colorPage.backButton.tap()
      // then
      XCTAssert(homePage.exists)
      let button = homePage.fiveColorsButton
      XCTAssert(button.staticTexts["20首"].exists)
    }
  
  func test_add20ofColor() {
    // given
    let colorPage = homePage.gotoFiveColorsPage()
    XCTContext.runActivity(named: "まず、青の20首を選んでおく") { _ in
      let sheet = colorPage.tapColorButton(of: .blue)
      sheet.selectOnlyThese20Button.tap()
      // then
      XCTAssert(colorPage.badge(of: 20).exists)
    }
    // when
    XCTContext.runActivity(named: "そこに、五色百人一首の黄色セットを追加する") { _ in
      let sheet = colorPage.tapColorButton(of: .yellow)
      sheet.addThese20Button.tap()
      // then
      XCTAssert(colorPage.badge(of: 40).exists)
      // when
      colorPage.backButton.tap()
      let theButton = homePage.fiveColorsButton
      XCTAssert(theButton.staticTexts["40首"].exists)
    }
  }
}
