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
        let expectation1 = XCTestExpectation(description: "Given closure executed")
        let expectation2 = XCTestExpectation(description: "Another Given closure executed")
        handler.player1FinishedAction = { expectation1.fulfill() }
        handler.player2FinishedAction = { expectation2.fulfill() }
        // when
        handler.startPlayer1()
        handler.startPlayer2()
        // then
        wait(for: [expectation1, expectation2], timeout: 10.0)
    }
}
