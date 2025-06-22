//
//  Digits01PickerViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2025/06/22.
//

@testable import TrialButtonAnimation
import XCTest

final class Digits01PickerViewModelTests: XCTestCase {
  func testInitViewModel() {
    // given
    let state100 = SelectedState100()
    // when
    let viewModel = Digits01PickerViewModel(state100: state100)
    // then
    XCTAssertNotNil(viewModel)
  }
  
}
