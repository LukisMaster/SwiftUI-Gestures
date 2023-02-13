//
//  CustomNavBarPreferenceKeys.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 02.02.2023.
//

import SwiftUI

struct CustomNavBarTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
}

struct CustomNavBarSubtitlePreferenceKey: PreferenceKey {
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
    
}

struct CustomNavBarBackButtonHiddenPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
    
}

struct CustomNavBarItemsLeading: PreferenceKey {
    static var defaultValue: CustomNavBarItem?
    
    static func reduce(value: inout CustomNavBarItem?, nextValue: () -> CustomNavBarItem?) {
        value = nextValue()
    }
}

struct CustomNavBarItemsTrailing: PreferenceKey {
    static var defaultValue: CustomNavBarItem?
    
    static func reduce(value: inout CustomNavBarItem?, nextValue: () -> CustomNavBarItem?) {
        value = nextValue()
    }
}

extension View {

    func customNavigationTitle (_ title: String) -> some View {
        preference(key: CustomNavBarTitlePreferenceKey.self, value: title)
    }
    
    func customNavigationSubtitle (_ subtitle: String?) -> some View {
        preference(key: CustomNavBarSubtitlePreferenceKey.self, value: subtitle)
    }
    
    func customNavigationBackButtonHidden (_ hidden: Bool) -> some View {
        preference(key: CustomNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    
    func customNavBarSideItems<LView: View, TView: View>(leading: LView, trailing: TView) -> some View {
        self
            .preference(key: CustomNavBarItemsLeading.self, value: CustomNavBarItem(leading))
            .preference(key: CustomNavBarItemsTrailing.self, value: CustomNavBarItem(trailing))
    }
    
    func customNavBarItems (title: String = "", subtitle: String? = nil, backButtonHidden: Bool = false, rightBar: CustomNavBarItem? = nil) -> some View {
        self
            .customNavigationTitle(title)
            .customNavigationSubtitle(subtitle)
            .customNavigationBackButtonHidden(backButtonHidden)
    }
    
}
