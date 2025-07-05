//
//  DigitsPickerPage01.swift
//  Shuffle100UITests
//
//  Created by Yoshifumi Sato on 2023/05/01.
//  Copyright © 2023 里 佳史. All rights reserved.
//

import Foundation
import XCTest

final class Digits01PickerPage: PageObjectable, WaitInUITest {
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
    static let title = "1の位の数で選ぶ"
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
