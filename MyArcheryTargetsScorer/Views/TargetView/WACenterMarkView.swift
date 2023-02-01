//
//  WACenterMarkView.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 22.11.2022.
//

import SwiftUI

struct WACenterMarkView: View {
    let size: Double
    var body: some View {
        ZStack {
            Group{
                Path { path in
                    path.move(to: CGPoint(x: 0.5 * size, y: 0 * size))
                    path.addLine(to: CGPoint(x: 0.5 * size, y: 1 * size))
                }
                .stroke(lineWidth: 0.25 * size)

                
                Path { path in
                    path.move(to: CGPoint(x: 0 * size, y: 0.5 * size))
                    path.addLine(to: CGPoint(x: 1 * size, y: 0.5 * size))
                }
                .stroke(lineWidth: 0.25 * size)
            }
            .frame(width: size, height: size)
        }
    }
}

struct WACenterMarkView_Previews: PreviewProvider {
    static var previews: some View {
        WACenterMarkView(size: 4)
            .previewLayout(.sizeThatFits)
    }
}
