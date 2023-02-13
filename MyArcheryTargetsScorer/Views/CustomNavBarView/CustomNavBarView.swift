//
//  CustomNavBarView.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 02.02.2023.
//

import SwiftUI

struct CustomNavBarView: View {
    @EnvironmentObject var appTheme : AppColorThemeViewModel
    @Environment(\.presentationMode) var presentationMode
    let showBackButton :Bool
    let title : String
    let subtitle: String?
    let leftBarItems: AnyView?
    let rightBarItems: AnyView?
    
    var body: some View {
        ZStack {
            titleSection
            HStack {
                if showBackButton {
                    backButton
                }
                leftBarItems
                Spacer()
                rightBarItems
            }
        }
        .padding()
        .foregroundColor(appTheme.text)
        .font(.headline)
        .background(
            appTheme.accent
                .ignoresSafeArea(edges: .top)
        )
        
        
        
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavBarView(
                showBackButton: true,
                title: "Title",
                subtitle: "Subtitle goes here",
                leftBarItems: AnyView(Text("ALO")),
                rightBarItems: AnyView(Image(systemName: "checkmark"))
            )
            .environmentObject(AppColorThemeViewModel())
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
