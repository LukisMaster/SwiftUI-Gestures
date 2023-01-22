//
//  TargetView.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 22.11.2022.
//

import SwiftUI

struct TargetView: View {
    let scaleToDisplay : Double
    
    let targetFace : TargetFaceWAProtocol
        
    var body: some View {
        
        
        ZStack {
            ForEach(0..<targetFace.scheme.toInt(), id: \.self) { targetIndex in
                ZStack {
                    
                    ForEach(0..<(targetFace.targetScoreZones.count), id: \.self) { index in
                        let targetZone  = getTargetZone(targetFace: targetFace, targetScoreZone: targetFace.targetScoreZones[index])
                        
                        Circle()
                            .foregroundColor( colorOfTargetZone(targetZone.color))
                            .overlay(
                                Circle()
                                    .strokeBorder(lineWidth: targetZone.borderWidth)
                                    .foregroundColor( colorOfTargetZone(targetZone.borderColor))
                            )
                            .frame(
                                width: targetZone.zoneDiameterMM,
                                height: targetZone.zoneDiameterMM
                            )
                        WACenterMarkView(size: targetFace.centerCrosshairSize)
                        
                    }
                    .padding(getTargetPadding(
                        targetIndex: targetIndex,
                        targetFace: targetFace
                    ))
                    .scaleEffect(scaleToDisplay)
                    
                }
            }

        }
    }
    
    
    
    private func getTargetPadding (targetIndex: Int, targetFace: TargetFaceWAProtocol) -> EdgeInsets {
        let targetCentersDistance = targetFace.centersDistance
        let triangleHeight = targetCentersDistance * sqrt(3) / 2

        var top = Double.zero
        var leading = Double.zero
        var bottom = Double.zero
        var trailing = Double.zero
        switch targetFace.scheme {
        case .one:
            break
        case .vegas where targetIndex == 0:
            top = triangleHeight
            trailing = targetCentersDistance
        case .vegas where targetIndex == 1:
            bottom = triangleHeight
        case .vegas where targetIndex == 2:
            top = triangleHeight
            leading = targetCentersDistance
        case .vertical where targetIndex == 0:
            bottom = targetCentersDistance * 2
        case .vertical where targetIndex == 1:
            break
        case .vertical where targetIndex == 2:
            top = targetCentersDistance * 2
        default:
            break
        }
        return EdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
    
    private func colorOfTargetZone (_ targetZoneColor: TargetColor) -> Color {
        switch targetZoneColor {
        case .yellowWA:
            return .yellowWA
        case .redWA:
            return .redWA
        case .blueWA:
            return .blueWA
        case .blackWA:
            return .blackWA
        case .whiteWA:
            return .whiteWA
        case .grayBorderWA:
            return .grayBorderWA
        }
    }
    
    private func getTargetZone (targetFace: TargetFaceWAProtocol, targetScoreZone: TargetScoreZone) -> TargetZone {
        let diameter = targetFace.fullDiameterMM.toDouble() * targetScoreZone.ratioToFullDiameter()
        let color = targetScoreZone.toTargetColorWA()
        let borderColor = targetScoreZone.toBorderColorWA(zonesTenTo: targetFace.zonesTenTo)
        let borderWidth = targetScoreZone.toBorderWidthMM()
        
        return TargetZone(zoneDiameterMM: diameter, color: color, borderColor: borderColor, borderWidth: borderWidth)
    }
    
    
}


struct TargetView_Previews: PreviewProvider {
    static var previews: some View {
        TargetView(scaleToDisplay: 1, targetFace: TargetFaceWA.wa40vegas)
            .previewLayout(.sizeThatFits)
    }
}
