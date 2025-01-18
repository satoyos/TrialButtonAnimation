//
//  VolumeSettingViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2025/01/18.
//

@testable import TrialButtonAnimation
import XCTest

final class VolumeSettingViewModelTests: XCTestCase {

    
    func testInitViewModel() {
        // given
        let viewModel = VolumeSettingViewModel(volume: 0.5)
        
        XCTAssertEqual(viewModel.binding.volume, 0.5)
    }

}
