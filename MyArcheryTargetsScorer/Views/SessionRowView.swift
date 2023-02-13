//
//  SessionRowView.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 01.02.2023.
//

import SwiftUI

struct SessionRowView: View {
    @EnvironmentObject var appTheme : AppColorThemeViewModel
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading) {
                Text("29.01.23")
                    .bold()
            }
            
            Spacer()
            HStack(spacing: 3) {
                TargetView(scaleToDisplay: 0.06, targetFace: TargetFaceWA.wa40)
                VStack(alignment: .leading, spacing: 0) {
                    Text("18m")
                    Text("x2")
                    Text("x300")
                }
                
                TargetView(scaleToDisplay: 0.06, targetFace: TargetFaceWA.wa40vegas)
                VStack(alignment: .leading, spacing: 0) {
                    Text("18m")
                    Text("x2")
                    Text("x300")
                }
                
                TargetView(scaleToDisplay: 0.06, targetFace: TargetFaceWA.wa40vertical)
                VStack(alignment: .leading, spacing: 0) {
                    Text("18m")
                    Text("x2")
                    Text("x300")
                }
                
                TargetView(scaleToDisplay: 0.06, targetFace: TargetFaceWA.wa80to5)
                VStack(alignment: .leading, spacing: 0) {
                    Text("18m")
                    Text("x2")
                    Text("x300")
                }
            }
            .font(.system(size:11, weight: .bold, design: .default))
            
            Spacer()
            
            VStack(alignment: .trailing){
                Text("585 / 600")
                    .bold()
                Text("avg: 9.75")
                
            }
        }
        .lineLimit(1)
        .font(.subheadline)
        .foregroundColor(appTheme.text)
    }
}

struct SessionRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SessionRowView()
                .previewLayout(.sizeThatFits)
            
            SessionRowView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
