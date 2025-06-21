//
//  Digits01ButtonViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2025/06/21.
//

@testable import TrialButtonAnimation
import XCTest

final class Digits01ButtonViewModelTests: XCTestCase {
  
  func testInit() throws {
    // given
    let viewModel = Digits01ButtonViewModel(digit01: Digits01.three)
    // then
    XCTAssertNotNil(viewModel)
    XCTAssertEqual(viewModel.digit01, .three)
    XCTAssertEqual(viewModel.output.fillType, .full)
  }
  
  
}
