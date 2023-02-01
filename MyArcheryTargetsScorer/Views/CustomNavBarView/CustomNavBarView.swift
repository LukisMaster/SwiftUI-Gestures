//
//  CustomNavBarView.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 02.02.2023.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let showBackButton :Bool
    let title : String
    let subtitle: String?
    
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            if showBackButton {
                backButton
                    .opacity(0)
            }
        }
        .padding()
        .foregroundColor(Color.appTheme.text)
        .font(.headline)
        .background(
            Color.appTheme.accent
                .ignoresSafeArea(edges: .top)
        )
        
        
        
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavBarView(showBackButton: true, title: "Title", subtitle: "Subtitle goes here")
            Spacer()
        }
    }
}

extension CustomNavBarView {
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
    }
}
