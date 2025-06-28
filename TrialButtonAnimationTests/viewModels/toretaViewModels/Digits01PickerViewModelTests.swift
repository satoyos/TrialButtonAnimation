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
  
  func testPartialSelected() {
      // given
      let state100 = SelectedState100()
        .cancelOf(number: 13) // 「つくばねの」を選択から外す
      // when
      let viewModel = Digits01PickerViewModel(state100: state100)
      // then
      XCTAssertEqual(viewModel.selectedNum, 99)
    XCTAssertEqual(Digits01.three.buttonViewModel.output.fillType, .partial)
  }
  
  func testTapPartialMakesFull() {
    // given
    let state100 = SelectedState100()
      .cancelOf(number: 13) // 「つくばねの」を選択から外す
    let digit: Digits01 = .three
    
    // when
    let viewModel = Digits01PickerViewModel(state100: state100)
    // then
    XCTAssertEqual(digit.buttonViewModel.output.fillType, .partial)
    // when
    viewModel.input.digitButtonTapped.send(digit)
    // then
    XCTAssertEqual(digit.buttonViewModel.output.fillType, .full)
    XCTAssertEqual(viewModel.selectedNum, 100)
  }
  
  func testTapFullMakesEmpty() {
    // given
    let state100 = SelectedState100()
    let viewModel = Digits01PickerViewModel(state100: state100)
    let digit = Digits01.two
    // when
    viewModel.input.digitButtonTapped.send(digit)
    XCTAssertEqual(digit                 .buttonViewModel.output.fillType, .empty)
    XCTAssertEqual(viewModel.selectedNum, 90)
    }
}
