//
//  Sec2FViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2024/11/09.
//

@testable import TrialButtonAnimation
import XCTest
import Combine

final class Sec2FViewModelTests_toreta: XCTestCase {
    private var cancellables: Set<AnyCancellable> = []
    
    func testInitViewModel() throws {
        // given
        let viewModel = Sec2FViewModel(startTime: 2.00, interval: 0.02)
        // then
        XCTAssertEqual(viewModel.output.secText, "2.00")
    }

    func testWhenTimerStartsSecTextChanges() {
        // given
        let viewModel = Sec2FViewModel(startTime: 2.00, interval: 0.02)
        // then
        XCTAssertEqual(viewModel.output.secText, "2.00")
        // when
        viewModel.input.startTimerRequest.send()
        // then
        let expectation = XCTestExpectation(description: "secText changes correctly!")
        viewModel.output.$secText
            .dropFirst()
            .filter{$0 == "1.98"}
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 0.1)
    }

}
