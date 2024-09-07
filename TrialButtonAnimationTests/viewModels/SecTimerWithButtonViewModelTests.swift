//
//  SecTimerWithButtonViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2024/08/31.
//

@testable import TrialButtonAnimation
import XCTest
import Combine


final class SecTimerWithButtonTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()

    func testInitView()  {
        // given
        let viewModel = SecTimerWithButton.ViewModel(startTime: 2.0)
        // then
        XCTAssertEqual(viewModel.timeViewModel.secText, "2.00")
    }

    func testWhenTimerStartsSecLabelChanges() {
        // given
        let viewModel = SecTimerWithButton.ViewModel(startTime: 2.0)
        // when
        viewModel.startTimer()
        // then
        let expectation = XCTestExpectation(description: "time label changes correctly!")
        viewModel.timeViewModel.$secText
            .filter { $0 == "1.98" }
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 0.1)
    }

    func testWhenTimerStartsIsTimerRunningTurnsToTrue() {
        // given
        let viewModel = SecTimerWithButton.ViewModel(startTime: 0.5)
        // then
        XCTAssertFalse(viewModel.isTimerRunning)
        // when
        viewModel.startTimer()
        // then
        let expectation = XCTestExpectation(description: "'isTimerRuggning' flag turns to true")
        viewModel.$isTimerRunning
            .print("In Test:")
            .dropFirst()
            .sink { bool in
                XCTAssertTrue(bool)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testWhenTimerCompletedCountDownIsTimerRunningReturnsToBeFalse() {
        // given
        let viewModel = SecTimerWithButton.ViewModel(startTime: 0.2)
        // then
        XCTAssertFalse(viewModel.isTimerRunning)
        // when
        viewModel.startTimer()
        // then
        let expectation = XCTestExpectation(description: "'isTimerRuggning' flag returns to be false")
        viewModel.$isTimerRunning
            .dropFirst(2)
            .sink { bool in
                XCTAssertFalse(bool)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 0.3)
    }
    
    func testWhenButtonTappedUserActionsGetDisabled() {
        // given
        let viewModel = SecTimerWithButton.ViewModel(startTime: 0.2)
        // then
        XCTAssertFalse(viewModel.isUserActionDisabled)
        // when
        viewModel.startTrialCountDown()
        // then
        let expectation = XCTestExpectation(description: "User action gets disabled")
        viewModel.$isUserActionDisabled
            .sink { bool in
                XCTAssertTrue(bool)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testWhenPlayer2FinishedUserActionsGetEnabled() {
        let viewModel = SecTimerWithButton.ViewModel(startTime: 0.2)
        // when
        viewModel.startTrialCountDown()
        // then
        // then
        let expectation = XCTestExpectation(description: "User action gets back enabled")
        viewModel.$isUserActionDisabled
            .print("in Test")
            .dropFirst()
            .filter { $0 == false }
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 20)
    }
}
