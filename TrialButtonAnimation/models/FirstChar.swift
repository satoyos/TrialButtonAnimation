//
//  FirstChar.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/05/09.
//

enum FirstChar {
  case justOne
  case u
  case tsu
  case shi
}

extension FirstChar: CaseIterable {}

extension FirstChar: CustomStringConvertible {
  var description: String {
    switch self {
    case .justOne: "一字決まり"
    case .u:       "う"
    case .tsu:     "つ"
    case .shi:     "し"
    }
  }
}

extension FirstChar {
  var title: String {
    switch self {
    case .justOne: "一字決まりの歌"
    default: "「\(description)」で始まる歌"
    }
  }
}

extension FirstChar {
  var poemNumbers: [Int] {
    switch self {
    case .justOne: [18, 22, 57, 70, 77, 81, 87]
    case .u:       [65, 74]
    case .tsu:     [13, 23]
    case .shi:     [37, 40]
    }
  }
}
