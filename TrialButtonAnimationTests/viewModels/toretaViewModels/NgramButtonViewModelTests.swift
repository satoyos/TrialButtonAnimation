//
//  NgramButtonViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2025/05/11.
//

@testable import TrialButtonAnimation
import XCTest

final class NgramButtonViewModelTests: XCTestCase {
  
  func testInit() {
    // given
    let viewModel = NgramButtonViewModel(firstChar: .justOne)
    // then
    XCTAssertNotNil(viewModel)
    XCTAssertEqual(viewModel.output.fillType, .full)
  }
  
}
