//
//  MenuRowViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2024/09/08.
//

@testable import TrialButtonAnimation
import XCTest

final class MenuRowViewModelTests: XCTestCase {
    func testInitViewModelWithValue() {
        // given
        let item = MenuItem(title: "aaa", value: "2.11")
        let viewModel = MenuRow.ViewModel(item: item)
        // then
        XCTAssertEqual(viewModel.text, "aaa")
        XCTAssertEqual(viewModel.valueText, "2.11")
    }
    
    func testInitViewModelWithoutValue() {
        // given
        let item = MenuItem(title: "aaa", value: nil)
        let viewModel = MenuRow.ViewModel(item: item)
        // then
        XCTAssertEqual(viewModel.text, "aaa")
        XCTAssertEqual(viewModel.valueText, "")
    }
}
