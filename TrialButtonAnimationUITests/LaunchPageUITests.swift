//
//  LaunchPageUITests.swift
//  TrialButtonAnimationUITests
//
//  Created by Yoshifumi Sato on 2024/09/16.
//

import XCTest

final class LaunchPageUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // given
        continueAfterFailure = false
        app.launch()
    }

    func testLaunchPageComesCorrectly() throws {
        _ = XCTSkip("To be implemented later")
        // then
//        let homePage = HomePage(app)


    }

}
