//
//  SettingsPublishingWrapperTests.swift
//  TrialButtonAnimationTests
//
//  Created by Yoshifumi Sato on 2024/12/04.
//

@testable import TrialButtonAnimation
import XCTest
import Combine

final class SettingsPublishingWrapperTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()

    func testInit() {
        // given
        let settings = Settings()
        let wrapper = SettingsPublishingWrapper(settings: settings)
        XCTAssertEqual(wrapper.interval, settings.interval)
    }
    
    func testSomethingChanged() {
        // given
        let settings = Settings()
        let wrapper = SettingsPublishingWrapper(settings: settings)
        var notified = false
        wrapper.somethingChanged
            .print("In Pipline")
            .sink { _ in
                notified = true
            }
            .store(in: &cancellables)
        // then
        XCTAssertFalse(notified)
        // when
        wrapper.interval = 0.5
        // then
        XCTAssertEqual(settings.interval, 0.5)
        XCTAssertTrue(notified)
    }
    

    
}
