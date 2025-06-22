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
  
  func testNumbersDescription() {
    // given
    let viewModel = Digits01ButtonViewModel(digit01: Digits01.two)
    // when
    let strToDisplay = viewModel.numbersDescription
    // then
    XCTAssertEqual(strToDisplay, "歌番号: 2, 12, 22, 32, 42, 52, 62, 72, 82, 92")
  }
}
