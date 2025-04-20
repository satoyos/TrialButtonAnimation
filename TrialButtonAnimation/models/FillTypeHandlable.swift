//
//  FillTypeHandlable.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/04/20.
//

protocol FillTypeHandlable {
   func fillType(of someNumbers: [Int],
                 in referenceNumbers: [Int]) -> FillType
}

extension FillTypeHandlable {
  func fillType(of someNumbers: [Int],
                in referenceNumbers: [Int]) -> FillType {
    comparePoemNumbers(selected: Set(someNumbers),
                       in: Set(referenceNumbers))
  }

  private func comparePoemNumbers(selected: Set<Int>, in reference: Set<Int>) -> FillType {
    let intersection = selected.intersection(reference)
    if intersection.isEmpty {
      return .empty
    } else if intersection == reference {
      return .full
    } else {
      return .partial
    }
  }
}
