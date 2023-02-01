//
//  SessionSettingsView.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 24.01.2023.
//

import SwiftUI

struct SessionSettingsView: View {
    var body: some View {
        VStack {
            Text("SessionSettingsView")
        }
        .navigationTitle("Shooting session settings")
    }
}

struct SessionSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SessionSettingsView()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
