//
//  CustomNavRightBar.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 11.02.2023.
//

import SwiftUI

struct CustomNavBarItem : Equatable {
    let id = UUID()
    let view: AnyView
    
    init <V: View> (_ view: V) {
        self.view = AnyView(view)
    }
    
    static func == (lhs: CustomNavBarItem, rhs: CustomNavBarItem) -> Bool {
        lhs.id == rhs.id
    }
}
