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
//    internal lazy var homePage = HomePage(app: app)
    private let timeOutSec = 8.0
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launchArguments.append("--uitesting")
        app.launch()
    }

  private func gotoFiveColorsPage() {
    let cell = app.cells.staticTexts["五色百人一首の色で選ぶ"].firstMatch
    cell.tap()
  }
    
    func test_goto5ColorsScreenWork() {
      // given
      let cell = app.cells.staticTexts["五色百人一首の色で選ぶ"].firstMatch
      // then
      XCTAssert(cell.exists)
      // when
      cell.tap()
      // then
      let colorPage = FiveColorsPage(app: app)
      XCTAssert(colorPage.exists)
    }
    
    func test_selectJust20ofColor() {
      // given
      gotoFiveColorsPage()
      // then
      let colorPage = FiveColorsPage(app: app)
      XCTAssert(colorPage.exists)
      // when
      let sheet = colorPage.tapColorButton(of: .green)
      // then
      XCTAssert(sheet.exists)
//      // when
//      sheet.selectOnlyThese20Button.tap()
//      // then
//      XCTAssert(colorPage.badge(of: 20).exists)
//      // when
//      colorPage.backButton.tap()
//      pickerPage.backToTopPage()
//      // then
//      XCTAssert(homePage.numberOfSelecttedPoems(is: 20))
    }
//    
//    func test_add20ofColor() {
//        // given
//        let pickPage = homePage.goToPoemPickerPage()
//        XCTContext.runActivity(named: "1字決まりの札を選んでおく") { _ in
//            pickPage.cancelAllButton.tap()
//            let ngramPage = pickPage.gotoNgramPickerPage()
//            ngramPage
//                .tapCell(type: .justOne)
//                .backToPickerButton.tap()
//        }
//        // when
//        XCTContext.runActivity(named: "そこに、五色百人一首の黄色セットを追加する") { _ in
//            let colorsPage = pickPage.gotoFiveColorsPage()
//            let sheet = colorsPage.tapColorButton(of: .yellow)
//            sheet.addThese20Button.tap()
//            // then
//            XCTAssert(colorsPage.badge(of: 24).exists)
//            // when
//            colorsPage.backButton.tap()
//            pickPage.backToTopPage()
//        }
//        // then
//        XCTAssert(homePage.numberOfSelecttedPoems(is: 24), "黄色の20枚には一字決まりの歌が3首含まれているので、足すと27枚ではなく24枚になる")
//    }
//    
//    func test_select2colors() {
//        // given
//        let pickerPage = homePage.goToPoemPickerPage()
//        let colorsPage = pickerPage.gotoFiveColorsPage()
//        // when
//        let sheet1 = colorsPage.tapColorButton(of: .green)
//        sheet1.selectOnlyThese20Button.tap()
//        let sheet2 = colorsPage.tapColorButton(of: .pink)
//        sheet2.addThese20Button.tap()
//        // then
//        XCTAssert(colorsPage.badge(of: 40).exists)
//        // when
//        colorsPage.backButton.tap()
//        pickerPage.backToTopPage()
//        // then
//        XCTAssert(homePage.numberOfSelecttedPoems(is: 40))
//    }
//    
}
