//
//  FirstCharPoemNumbersTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2025/05/09.
//

@testable import TrialButtonAnimation
import XCTest

final class FirstCharTests: XCTestCase {
  func testCorrectNumbers() {
    XCTAssertEqual(FirstChar.justOne.poemNumbers, [18, 22, 57, 70, 77, 81, 87])
  }
  
}
