//
//  NgramPickerViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2025/05/14.
//

@testable import TrialButtonAnimation
import Combine
import XCTest

final class NgramPickerViewModelTests: XCTestCase {
  var cancellables: Set<AnyCancellable> = []
  
  func testInitViewModel() {
    // given
    let state100 = SelectedState100() // all poems are selected.
    // when
    let viewModel = NgramPickerViewModel(state100: state100)
    // then
    XCTAssertNotNil(viewModel)
    XCTAssertEqual(viewModel.output.state100.selectedNum, 100)
    XCTAssertEqual(FirstChar.u.buttonViewModel.output.fillType, .full)
  }
  


}
