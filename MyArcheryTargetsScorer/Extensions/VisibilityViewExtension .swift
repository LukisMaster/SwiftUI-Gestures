//
//  VisibilityViewExtension .swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 19.11.2022.
//

import SwiftUI

enum ViewVisibility: CaseIterable {
    case visible, // view is fully visible
         invisible, // view is hidden but takes up space
         gone // view is fully removed from the view hierarchy
}

extension View {
    @ViewBuilder func visibility(_ visibility: ViewVisibility) -> some View {
        if visibility != .gone {
            if visibility == .visible {
                self
            } else {
                hidden()
            }
        }
    }
}
