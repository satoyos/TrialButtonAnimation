//
//  NgramSectionTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2025/05/11.
//

@testable import TrialButtonAnimation
import XCTest

final class NgramSectionTests: XCTestCase {

  func testNgramSections()  {
    // given
    let sections = NgramSections.default
    // then
    XCTAssertEqual(sections.count, 9)
    XCTAssertEqual(sections[0].title, "一枚札")
    XCTAssertEqual(sections[0].firstChars.count, 1)
    XCTAssertEqual(sections[0].firstChars[0], .justOne)
    XCTAssertEqual(sections[2].firstChars.count, 4)
    
  }

    

}
