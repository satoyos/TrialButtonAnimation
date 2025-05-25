//
//  NgramPickerPage.swift
//  Shuffle100UITests
//
//  Created by Yoshifumi Sato on 2021/07/03.
//  Copyright © 2021 里 佳史. All rights reserved.
//

import Foundation
import XCTest

enum NgramCellType: String {
    case justOne = "一字決まりの歌"
    case u = "u"
    case tsu = "tsu"
    case shi = "shi"
    case mo = "mo"
    case yu = "yu"
}

final class NgramPickerPage: PageObjectable {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var pageTitle: XCUIElement {
        return app.staticTexts[A11y.title].firstMatch
    }
    
    var backButton: XCUIElement {
        app.navigationBars.buttons[A11y.backToTop].firstMatch
    }
    
    enum A11y {
        static let title = "1字目で選ぶ"
        static let backToTop = "トップ"
    }
    
    func badge(of number: Int) -> XCUIElement {
        app.navigationBars.staticTexts["\(number)首"]
    }
    
    @discardableResult
    func tapCell(type: NgramCellType) -> Self {
        cell(type: type).tap()
        return self
    }
    
    private func cell(type: NgramCellType) -> XCUIElement {
        return app.buttons[type.rawValue].firstMatch
    }
}
