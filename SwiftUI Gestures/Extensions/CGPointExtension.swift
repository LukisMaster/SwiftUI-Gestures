//
//  CGPointExtension.swift
//  SwiftUI Gestures
//
//  Created by Sergey Nestroyniy on 23.11.2022.
//

import SwiftUI

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}
