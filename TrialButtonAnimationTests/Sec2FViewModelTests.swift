//
//  Sec2FViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2024/08/20.
//

@testable import TrialButtonAnimation
import XCTest

final class Sec2FViewModelTests: XCTestCase {
    
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
    }
}
