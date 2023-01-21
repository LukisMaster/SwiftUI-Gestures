//
//  ContentView.swift
//  SwiftUI Gestures
//
//  Created by Sergey Nestroyniy on 19.11.2022.
//

import SwiftUI


struct ShootingView: View {
        
    @StateObject var viewModel : ShootingViewModel
    
    var body: some View {
        
        let aimingDragGesture = DragGesture()
            .onChanged { dragGestureValue in
                viewModel.aimingGestureChanged(location: dragGestureValue.location)
            }
            .onEnded { _ in
                viewModel.aimingGestureEnded()
            }
        VStack {
            VStack {
                Text("Hit index:")
                ForEach(viewModel.hitIndexesAtNearTarget, id: \.self) { hitIndex in
                    Text("\(hitIndex) : \(viewModel.hits[hitIndex].distanceToCenter)")
                }
            }
            
            HStack {
                Text("Score:      ")
                ForEach(0..<viewModel.shots.count, id: \.self) { index in
                    Text(viewModel.shots[index])
                }
            }
            
            ZStack {
                Color.clear
                    .measureGeometrySize(action: { geometrySize in
                        viewModel.setGeometrySize(size: geometrySize)
                    })
                
                
                TargetView(
                    scaleToDisplay: viewModel.scaleToDisplay,
                    targetFace: viewModel.targetFace
                )
                .position(viewModel.targetSheetCenterPosition)
                .opacity(viewModel.isTargetSheetVisible ? 1 : 0)
                .scaleEffect(viewModel.isAiming ? viewModel.aimingScale : 1,
                             anchor: viewModel.markPoint
                )
                
                
                ZStack {
                    Circle()
                        .frame(width: viewModel.markCircleSize, height: viewModel.markCircleSize)
                        .foregroundColor(.markerColor)
                    Text(viewModel.markScoreText)
                        .font(.system(size: viewModel.markScoreFontSize))
                }
                .visibility(viewModel.markVisibility)
                .position(viewModel.markPosition)
                
            }
            
            .onAppear {
                viewModel.shootingFieldOnAppear()
            }
            
            .gesture(aimingDragGesture)
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShootingView(
            viewModel: ShootingViewModel(
                targetFace: TargetFaceWA(
                    fullDiameterMM: .d400,
                    zonesTenTo: 1,
                    centerScoreStyle: .withX,
                    centerCrosshairSize: 4,
                    scheme: .vertical,
                    spacing: 20
                ),
                arrowDiameterMM: 9.3,
                markOffsetY: -30,
                scaleRatio: 4,
                shotsMaxNumber: 6,
                shotsPerTargetNumber: 2,
                seriesNumber: nil
            )
        )
        .previewLayout(.device)
        .previewDevice("iPhone 8")
    }
}
