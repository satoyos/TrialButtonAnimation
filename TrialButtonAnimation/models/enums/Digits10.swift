//
//  Digits10.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/07/05.
//


enum Digits10: Int {
  case zero  = 0
  case one   = 1
  case two   = 2
  case three = 3
  case four  = 4
  case five  = 5
  case six   = 6
  case seven = 7
  case eight = 8
  case nine  = 9
  case ten   = 10
}

extension Digits10: CaseIterable {}

extension Digits10: Identifiable {
  var id: Self {
    self
  }
}

extension Digits10: CustomStringConvertible {
  var description: String {
    String(rawValue)
  }
}

extension Digits10 {
  var poemNumbers: [Int] {
    switch self {
    case .zero: return Array(1...9)
    case .ten:  return [100]
    default:
      return Array(0...9)
        .map { self.rawValue * 10 + $0 }
    }
  }
}
