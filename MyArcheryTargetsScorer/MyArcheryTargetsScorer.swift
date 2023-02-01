//
//  MyArcheryTargetsScorer.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 19.11.2022.
//

import SwiftUI

@main
struct MyArcheryTargetsScorerApp: App {
    @StateObject var viewModel = HomeViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some Scene {
        WindowGroup {
            CustomNavView {
                HomeView()
                    .environmentObject(viewModel)
                    .customNavBarItems(title: "My Archery Target Scorer", subtitle: nil, backButtonHidden: true)
            }
        }
    }
}
