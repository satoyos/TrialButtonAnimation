//
//  Sec2FViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2024/11/09.
//

@testable import TrialButtonAnimation
import XCTest

final class Sec2FViewModelTests_toreta: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws {}

    func testInitViewModel() throws {
        // given
        let viewModel = Sec2FViewModel(startTime: 2.00, interval: 0.02)
        // then
        XCTAssertEqual(viewModel.output.secText, "2.00")
    }

    

}
