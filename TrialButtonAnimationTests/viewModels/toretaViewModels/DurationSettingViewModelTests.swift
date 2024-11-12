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
    

    func testInitViewModel()  {
        // given
        let viewModel = DurationSettingViewModel(startTime: 2.0)
        // then
        XCTAssertEqual(viewModel.output.secText, "2.00")
    }

    
}
