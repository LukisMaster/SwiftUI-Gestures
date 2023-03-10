//
//  CustomNavBarContainerView.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 02.02.2023.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    let content : Content
    @State private var leftBarItems: AnyView = AnyView(EmptyView())
    @State private var rightBarItems: AnyView = AnyView(EmptyView())
    @State private var showBackButton = true
    @State private var title = ""
    @State private var subtitle: String? = nil

    
    init(@ViewBuilder content: ()->Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(
                showBackButton: showBackButton,
                title: title,
                subtitle: subtitle,
                leftBarItems: leftBarItems,
                rightBarItems: rightBarItems
            )
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self) { value in
            self.title = value
        }
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKey.self) { value in
            self.subtitle = value
        }
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self) { value in
            self.showBackButton = !value
        }
        .onPreferenceChange(CustomNavBarItemsLeading.self) { value in
            self.leftBarItems = value?.view ?? AnyView(EmptyView())
        }
        .onPreferenceChange(CustomNavBarItemsTrailing.self) { value in
            self.rightBarItems = value?.view ?? AnyView(EmptyView())
        }
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    
    static var previews: some View {
        CustomNavBarContainerView {
            ZStack {
                Text("Hello, world! ")
                    .foregroundColor(AppColorThemeViewModel().text)
                    .customNavigationTitle("New title")
                    .customNavigationSubtitle("Subtitle")
                    .customNavigationBackButtonHidden(false)
                    .customNavBarSideItems(leading: EmptyView(),trailing: Text("privet"))
            }
        }
        .environmentObject(AppColorThemeViewModel())
    }
}

extension Button: Equatable {
    public static func == (lhs: Button, rhs: Button) -> Bool {
        true
    }
}
