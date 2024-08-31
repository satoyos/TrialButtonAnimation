//
//  SecTimerWithButtonTests.swift
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

}
