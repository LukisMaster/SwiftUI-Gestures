//
//  SwiftUI_GesturesApp.swift
//  SwiftUI Gestures
//
//  Created by Sergey Nestroyniy on 19.11.2022.
//

import SwiftUI

@main
struct SwiftUI_GesturesApp: App {
    var body: some Scene {
        WindowGroup {
            ShootingView(
                viewModel: ShootingViewModel(
                    targetFace: TargetFaceWA(
                        fullDiameterMM: .d400,
                        zonesTenTo: 6,
                        centerScoreStyle: .withX,
                        centerCrosshairSize: 4,
                        scheme: .vertical,
                        spacing: 20
                    ),
                    arrowDiameterMM: 9.3,
                    markOffsetY: -30,
                    scaleRatio: 4,
                    shotsMaxNumber: 6,
                    shotsPerTargetNumber: 2
                )
            )
        }
    }
}
