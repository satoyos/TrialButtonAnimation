//
//  CountDownTimerTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2024/07/26.
//

@testable import TrialButtonAnimation
import XCTest
import Combine

final class CountDownTimerTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()

    func testInitCountDownTimer() {
        // given
        let timer = CountDownTimer(startTime: 3.0, intarval: 1.0)
        // then
        XCTAssertEqual(timer.remainTime, 3.0)
        XCTAssertFalse(timer.isRunning)
    }

    func testRunningCountDownTimerChangesRemainTime() {
        // given
        let timer = CountDownTimer(startTime: 3.0, intarval: 1.0)
        let expectetion = XCTestExpectation(description: "Timer is reducing remain time correctly.")
        // then
        XCTAssertFalse(timer.isRunning)
        // when
        timer.start()
        // then
        timer.$remainTime
            .dropFirst()
            .print("remainTime: ")
            .sink { value in
                XCTAssertEqual(value, 2.0)
                expectetion.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectetion], timeout: 1.1)
    }
    
    func testRunningCountDownTimerChagnesRunningFlag() {
        // given
        let timer = CountDownTimer(startTime: 2.0, intarval: 0.02)
        let expectation2 = XCTestExpectation(description: "Timer is running just after start")
        // when
        timer.start()
        // then
        timer.$isRunning
            .print("for exp2:")
            .dropFirst()
            .sink { bool in
                XCTAssertTrue(bool)
                expectation2.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation2], timeout: 0.1)
    }
    
    func testWhenCountDownCompletedRunningFlagGetsFalse() {
        // given
        let timer = CountDownTimer(startTime: 0.3, intarval: 0.02)
        let expectation3 = XCTestExpectation(description: "Timer is not rugging after count down get end")
        // when
        timer.start()
        timer.$isRunning
            .print("for exp3:")
            .dropFirst(2)
            .sink { bool in
                XCTAssertFalse(bool)
                expectation3.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation3], timeout: 0.4)
        
    }
    
    func testWhehGettingRequestToRestTimerMustGetRest() {
        // given
        let timer = CountDownTimer(startTime: 0.3, intarval: 0.02)
        // when
        timer.start()
        timer.reset(to: 1.0)
        // then
        XCTAssertEqual(timer.remainTime, 1.0)
    }

    func testStoppingTimerMakesRunningFlagFalse() {
        // given
        let timer = CountDownTimer(startTime: 1.0, intarval: 0.1)
        timer.start()
        let expectation = XCTestExpectation(description: "Timer running")
        timer.$isRunning
            .dropFirst()
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 0.2)
        // when
        timer.stop()
        // then
        XCTAssertFalse(timer.isRunning)
    }
}
