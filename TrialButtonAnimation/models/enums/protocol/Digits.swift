//
//  Digits.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/07/12.
//

protocol Digits: RawRepresentable, CaseIterable, Identifiable, CustomStringConvertible, PoemNumbersProvidable
where RawValue == Int {
  
}

extension Digits {
  var id: Self {
    self
  }
  
  var description: String {
    String(rawValue)
  }
}
