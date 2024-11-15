//
//  DurationSettingViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2024/11/12.
//

@testable import TrialButtonAnimation
import XCTest
import Combine

final class DurationSettingViewModelTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []

    func testInitViewModel()  {
        // given
        let viewModel = DurationSettingViewModel(startTime: 2.0)
        // then
        XCTAssertEqual(viewModel.output.secText, "2.00")
    }

    func testWhenTimerStartsSecLabelChanges() {
        // given
        let viewModel = DurationSettingViewModel(startTime: 2.0)
        // when
        viewModel.input.startTimerRequest.send()
        // then
        let expectation = XCTestExpectation(description: "time label changes correctly!")
        viewModel.output.$secText
            .filter { $0 == "1.98" }
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testWhenTimerStartsIsTimerRunningTurnsToTrue() {
        // given
        let viewModel = DurationSettingViewModel(startTime: 0.5)
        // then
        XCTAssertFalse(viewModel.output.isTimerRunning)
        // when
        viewModel.input.startTimerRequest.send()
        // then
        let expectation = XCTestExpectation(description: "'isTimerRuggning' flag turns to true")
        viewModel.output.$isTimerRunning
            .dropFirst()
            .sink { bool in
                XCTAssertTrue(bool)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testWhenTimerCompletedCountDownIsTimerRunningTurnsToBeFalse() {
        // given
        let viewModel = DurationSettingViewModel(startTime: 0.2)
        // then
        XCTAssertFalse(viewModel.output.isTimerRunning)
        // when
        viewModel.input.startTimerRequest.send()
        // then
        let expectation = XCTestExpectation(description: "'isTimerRuggning' flag returns to be false")
        viewModel.output.$isTimerRunning
            .dropFirst(2)
            .sink { bool in
                XCTAssertFalse(bool)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 0.3)
    }
    
    func testWhenButtonTappedUserActionsGetDisabled() throws {
        throw XCTSkip("Try this test after implementing audio-functions in DurationSettingViewModel")
        // given
        let viewModel = DurationSettingViewModel(startTime: 0.2)
        // then
        XCTAssertFalse(viewModel.output.isUserActionDisabled)
        // when
        viewModel.input.startTrialCountDownRequest.send()
        // then
        let expectation = XCTestExpectation(description: "User action gets disabled")
        viewModel.output.$isUserActionDisabled
            .sink { bool in
                XCTAssertTrue(bool)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 0.1)
    }
    
}
