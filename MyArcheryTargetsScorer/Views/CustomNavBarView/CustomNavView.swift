//
//  CustomNavView.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 02.02.2023.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
    let content : Content
    
    init(@ViewBuilder content: ()->Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            CustomNavBarContainerView {
                content
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct CustomNavView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView {
                Text("Hello, World!")
        }
    }
}

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
