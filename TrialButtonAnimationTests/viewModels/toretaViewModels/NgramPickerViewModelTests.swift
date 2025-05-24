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
    XCTAssertEqual(viewModel.selectedNum, 100)
    XCTAssertEqual(FirstChar.u.buttonViewModel.output.fillType, .full)
  }
  
  func testPartialSelected() {
    // given
    let state100 = SelectedState100()
      .cancelOf(number: 13) // 「つくばねの」を選択から外す
    // when
    let viewModel = NgramPickerViewModel(state100: state100)
    // then
    XCTAssertEqual(viewModel.selectedNum, 99)
    XCTAssertEqual(FirstChar.tsu.buttonViewModel.output.fillType, .partial)
  }
  


}
