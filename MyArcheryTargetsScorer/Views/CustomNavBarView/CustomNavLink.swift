//
//  CustomNavLink.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 02.02.2023.
//

import SwiftUI

struct CustomNavLink<Label: View, Destination: View>: View {
    let destination : Destination
    var label : Label
    
    init(destination: Destination, @ViewBuilder label: ()->Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink {
            CustomNavBarContainerView {
                destination
            }
            .navigationBarHidden(true)
        } label: {
            label
        }
        
    }
}

struct CustomNavLink_Previews: PreviewProvider {

    static var previews: some View {
        CustomNavView {
            CustomNavLink(destination: Text("Destination")) {
                Text("Click me")
                    .foregroundColor(AppColorThemeViewModel().text)
            }
        }
        .environmentObject(AppColorThemeViewModel())
    }
}
