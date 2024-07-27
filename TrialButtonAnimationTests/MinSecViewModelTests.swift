//
//  MinSecViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2024/07/27.
//

@testable import TrialButtonAnimation
import Combine
import XCTest

final class MinSecViewModelTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()

    func testInitViewModel() {
        // given
        let viewModel = MinSec.ViewModel(startTime: 80, interval: 1)
        // then
        XCTAssertEqual(viewModel.minText, "1")
        XCTAssertEqual(viewModel.secText, "20")
    }
    
    func testWhenTimerStartsMinSecTextChanges() {
        // given
        let viewModel = MinSec.ViewModel(startTime: 60, interval: 1)
        // then
        XCTAssertEqual(viewModel.minText, "1")
        XCTAssertEqual(viewModel.secText, "00")
        // when
        viewModel.startTimer()
        // then
        let expectation1 = XCTestExpectation(description: "minText changes correctly!")
        viewModel.$minText
            .dropFirst()
            .sink { value in
                XCTAssertEqual(value, "0")
                expectation1.fulfill()
            }
            .store(in: &cancellables)
        let expectation2 = XCTestExpectation(description: "secText changes correctly!")
        viewModel.$secText
            .dropFirst()
            .sink { value in
                XCTAssertEqual(value, "59")
                expectation2.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation1, expectation2], timeout: 1.1)
    }

}
