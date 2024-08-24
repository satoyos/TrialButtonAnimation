//
//  Sec2FViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2024/08/20.
//

@testable import TrialButtonAnimation
import XCTest
import Combine

final class Sec2FViewModelTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()
    
    func testInitViewModel() {
        // given
        let viewModel = Sec2F.ViewModel(startTime: 2.00, interval: 0.02)
        // then
        XCTAssertEqual(viewModel.secText, "2.00")
    }

    func testWhenTimerStartsSecTextChanges() {
        // given
        let viewModel = Sec2F.ViewModel(startTime: 2.00, interval: 0.02)
        // then
        XCTAssertEqual(viewModel.secText, "2.00")
        // when
        viewModel.startTimer()
        // then
        let expectation = XCTestExpectation(description: "secText changes correctly!")
        viewModel.$secText
            .dropFirst()
            .filter{$0 == "1.98"}
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 0.1)
    }
}
