//
//  DurationSettingAudioHandlerTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2024/11/17.
//

@testable import TrialButtonAnimation
import XCTest

final class DurationSettingAudioHandlerTests: XCTestCase {

    func testInit() throws {
        // given
        let handler = DurationSettingAudioHandler()
        // then
        XCTAssertNil(handler.player1FinishedAction)
    }

    func testAfterPlayFinishedGivenClosureExecuted() throws {
        // given
        let handler = DurationSettingAudioHandler()
        let expectation = XCTestExpectation(description: "Given closure executed")
        handler.player1FinishedAction = { expectation.fulfill() }
        // when
        handler.startPlayer1()
        // then
        wait(for: [expectation], timeout: 10.0)
    }
}
