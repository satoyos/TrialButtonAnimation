//
//  Digits10PickerPage.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/07/12.
//

import XCTest

final class Digits10PickerPage: PageObjectable, WaitInUITest {
  
  let app: XCUIApplication
  
  init(app: XCUIApplication) {
    self.app = app
  }
  
  var pageTitle: XCUIElement {
    app.navigationBars.staticTexts[A11y.title].firstMatch
  }
  
  var backToTopButton: XCUIElement {
     app.navigationBars
      .buttons[A11y.backToTop].firstMatch
  }
  
  enum A11y {
    static let title = "10の位の数で選ぶ"
    static let backToPicker = "歌を選ぶ"
    static let backToTop = "トップ"
  }
  
  @discardableResult
  func tapCell(number: Int) -> Self {
    app.buttons[number.description].firstMatch.tap()
    return self
  }
  
  func badge(of number: Int) -> XCUIElement {
    app.navigationBars.staticTexts["\(number)首"]
  }

}

