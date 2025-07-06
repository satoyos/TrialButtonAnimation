//
//  Digits10ButtonViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2025/07/06.
//

@testable import TrialButtonAnimation
import XCTest

final class Digits10ButtonViewModelTests: XCTestCase {
  
  func testInit() throws {
    // given
    let theDigit = Digits10.three
    let viewModel = Digits10ButtonViewModel(digit: theDigit)
    // then
    XCTAssertNotNil(viewModel)
    XCTAssertEqual(viewModel.digit, theDigit)
    XCTAssertEqual(viewModel.output.fillType, .full)
  }
}
