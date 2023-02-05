//
//  measureSize.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 05.12.2022.
//

import SwiftUI

struct TargetViewGeometrySizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero

  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
 //   value = nextValue() //вроде бы надо, но почему-то не работало с этой строкой =/
  }
}

extension View {
    func measureGeometrySize(action: @escaping (_ geometrySize: CGSize) -> Void) -> some View {
        self
            .background(
                GeometryReader { geometry in
                    Color
                        .clear
                        .preference(key: TargetViewGeometrySizePreferenceKey.self, value: geometry.size)
                }
            )
            .onPreferenceChange(TargetViewGeometrySizePreferenceKey.self, perform: { value in
                action(value)
            })
    }
}
