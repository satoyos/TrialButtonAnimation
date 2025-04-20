//
//  FillType.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/04/20.
//

import Foundation

enum FillType {
  case empty
  case partial
  case full
}

extension FillType {
  var imageName: String {
    switch self {
    case .empty:   "5ColorEmpty"
    case .partial: "5ColorHalf"
    case .full:    "5ColorFull"
    }
  }
}

