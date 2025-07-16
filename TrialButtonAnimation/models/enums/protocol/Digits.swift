//
//  Digits.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/07/12.
//

protocol Digits: RawRepresentable, CaseIterable, Identifiable, CustomStringConvertible, Hashable, PoemNumbersProvidable
where RawValue == Int {
  var buttonViewModel: DigitsButtonViewModel<Self> { get }
}

extension Digits {
  var id: Self {
    self
  }
  
  var description: String {
    String(rawValue)
  }
}
