//
//  ReciteViewButtonViewModelTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2024/07/21.
//

@testable import TrialButtonAnimation
import XCTest

final class ReciteViewButtonViewModelTests: XCTestCase {

    func testWhenButtonPushedGivenClosureGetExecuted() {
        // given
        var isCalled = false
        let viewModel = ReciteViewButton.ViewModel()
        viewModel.pushedAction = { isCalled = true }
        // when
        viewModel.pushedAction?()
        // then
        XCTAssertTrue(isCalled)
    }
    
    func testWhenPlayTypePushedCauseTypeChangeToPause() {
        // given
        let viewModel = ReciteViewButton.ViewModel(type: .play)
        viewModel.pushedAction = { viewModel.type = .pause }
        // when
        viewModel.pushedAction?()
        // then
        XCTAssertEqual(viewModel.type, .pause)
    }
    
    // ToDo: PlayButtonと、forward/rewindボタンの実装を分けたい。
    //       ReciteViewButtonのほとんどをプロトコル化する？

}
