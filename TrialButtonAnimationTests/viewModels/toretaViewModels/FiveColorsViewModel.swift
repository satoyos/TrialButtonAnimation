//
//  FiveColorsViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/04/19.
//

@testable import TrialButtonAnimation
import XCTest
import Combine

final class FiveColorsViewModelTests: XCTestCase {
  var cancellables: Set<AnyCancellable> = []
  
  func testInitViewModel() {
    // given
    let state100 = SelectedState100()
    // when
    let viewModel = FiveColorsViewModel(state100: state100)
    // then
    XCTAssertNotNil(viewModel)
    for color in FiveColors.all {
      XCTAssertEqual(color.buttonViewModel.output.fillType, .full)
    }
  }
  
  func testPartialSelected() {
    // given
    let state100 = SelectedState100()
      .cancelOf(number: 1)
    // then
    XCTAssertEqual(FiveColorsViewModel.fillType(of: .pink, for: state100), .partial)
    XCTAssertEqual(FiveColorsViewModel.fillType(of: .green, for: state100), .full)
  }
  
  func testSelectJust20OfColor() {
    // given
    let state100 = SelectedState100()
    // when
    let viewModel = FiveColorsViewModel(state100: state100)
    // then
    XCTAssertEqual(viewModel.output.state100.selectedNum, 100)
    // when
    viewModel.input.selectJust20OfColor.send(.pink)
    // then
    XCTAssertEqual(viewModel.output.state100.selectedNum, 20)
    XCTAssert(viewModel.output.state100.allSelectedNumbers.contains(1))
    XCTAssertFalse(viewModel.output.state100.allSelectedNumbers.contains(14))
  }
}
