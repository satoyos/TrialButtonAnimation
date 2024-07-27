//
//  MemorizeTimerViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2024/07/27.
//

@testable import TrialButtonAnimation
import XCTest
import Combine

final class MemorizeTimerViewModelTests: XCTestCase {

    func testInitViewModel() {
        // given
        let viewModel = MemorizeTimer.ViewModel(minutes: 3)
        // then
        XCTAssertEqual(viewModel.timeViewModel.minText, "3")
        XCTAssertEqual(viewModel.timeViewModel.secText, "00")
        XCTAssertEqual(viewModel.buttonViewModel.type, .play)
    }
    
    func testWhenPlayButtonTappedTimerStartCountDown() {
        // given
        let viewModel = MemorizeTimer.ViewModel(minutes: 3)
        let timerViewModel = viewModel.timeViewModel
        let buttonViewModel = viewModel.buttonViewModel
        var cancellables = Set<AnyCancellable>()
        let expectation1 = XCTestExpectation(description: "setText, minText, button type are all changing correctly")
        buttonViewModel.playButtonTapped()
        timerViewModel.$secText
            .dropFirst()
            .print("in Unit Test: ")
            .sink { value in
                XCTAssertEqual(value, "59")
                XCTAssertEqual(timerViewModel.minText, "2")
                XCTAssertEqual(buttonViewModel.type, .pause)
                expectation1.fulfill()
            }
            .store(in: &cancellables)
        // when
        // then
        wait(for: [expectation1], timeout: 1.1)
    }
}
