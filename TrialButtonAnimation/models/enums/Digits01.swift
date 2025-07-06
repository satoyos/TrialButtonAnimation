//
//  Digits01.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/06/21.
//

enum Digits01: Int {
  case one   = 1
  case two   = 2
  case three = 3
  case four  = 4
  case five  = 5
  case six   = 6
  case seven = 7
  case eight = 8
  case nine  = 9
  case zero  = 0
}

extension Digits01: CaseIterable {}

extension Digits01: Identifiable {
  var id: Self {
    self
  }
}

extension Digits01: CustomStringConvertible {
  var description: String {
    String(rawValue)
  }
}

extension Digits01 {
  var poemNumbers: [Int] {
    switch self {
    case .zero:
      return Array(1...10).map {$0 * 10}
    default:
      return Array(0...9)
        .map {$0 * 10 + self.rawValue}
    }
  }
}
