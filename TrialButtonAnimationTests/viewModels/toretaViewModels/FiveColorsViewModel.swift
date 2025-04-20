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
      XCTAssertEqual(viewModel.fillType(of: color), .full)
    }
  }
  
  func testPartialSelected() {
    // given
    let state100 = SelectedState100()
      .cancelOf(number: 1)
    // when
    let viewModel = FiveColorsViewModel(state100: state100)
    // then
    XCTAssertEqual(viewModel.fillType(of: .pink), .partial)
    XCTAssertEqual(viewModel.fillType(of: .green), .full)
  }
}
