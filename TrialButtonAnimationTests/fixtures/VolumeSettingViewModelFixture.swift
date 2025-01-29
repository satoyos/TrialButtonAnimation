//
//  VolumeSettingViewModelFixture.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/01/29.
//

@testable import TrialButtonAnimation

extension VolumeSettingViewModel {
  static func fixture(volume: Double = 0.8) -> VolumeSettingViewModel {
    .init(volume: volume)
  }
}
