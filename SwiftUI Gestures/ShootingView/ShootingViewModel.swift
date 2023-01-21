//
//  ShootingViewModel.swift
//  SwiftUI Gestures
//
//  Created by Sergey Nestroyniy on 25.11.2022.
//

import SwiftUI

protocol ShootingViewModelProtocol {
    //init
    
    var targetFace : TargetFaceWAProtocol { get }
    var arrowDiameterMM : Double { get }
    var markOffsetY : Double { get }
    var scaleRatio: Double { get }
    var shotsMaxNumber : Int { get }
    var shotsPerTargetNumber : Int { get }
    var seriesNumber: Int? { get }
    
    //property
    
    var geometrySize: CGSize { get }
    var isAiming : Bool { get }
    var shots : [String] { get }
    
    
    var isTargetSheetVisible : Bool { get }
    var markVisibility : ViewVisibility { get }

    //computed

    var hitIndexesAtNearTarget : [Int] { get }
    var scaleToDisplay : Double { get }
    var targetSheetCenterPosition : CGPoint { get }
    var aimingScale : Double { get }
    var markPoint : UnitPoint { get }
    var markCircleSize : CGFloat { get }
    var markScoreText : String { get }
    var markScoreFontSize : CGFloat { get }
    var markPosition : CGPoint { get }
    var targetFullDiameterMM : Double { get }
    
    // func
    func shootingFieldOnAppear()
    func aimingGestureChanged(location: CGPoint)
    func aimingGestureEnded()
    func setGeometrySize(size: CGSize)
}

final class ShootingViewModel : ShootingViewModelProtocol, ObservableObject  {
    
    var shots: [String] = []
    var isTargetSheetVisible: Bool
    var markVisibility : ViewVisibility
    let targetFullDiameterMM : Double

    func setGeometrySize(size: CGSize) {
        geometrySize = size
    }
    
    func shootingFieldOnAppear() {
        withAnimation(.easeInOut(duration: 1)) {
            isTargetSheetVisible = true
        }
    }
    
    func aimingGestureChanged(location: CGPoint) {
        guard hits.count < shotsMaxNumber else { return }
        withAnimation(.easeIn(duration: 0.15)) {
            fingerPosition = location
        }
        markVisibility = .visible
        withAnimation(.easeIn(duration: 0.3)) {
            isAiming = true
        }
    }
    
    func aimingGestureEnded() {
        guard hits.count < shotsMaxNumber else { return }
        hits.append(Hit(
            score: markScore.toInt(centerScoreStyle: targetFace.centerScoreStyle),
            isSmallTen: markScore == .smallTen,
            isAtTarget: hitIsAtTarget,
            positionX: markPosition.x,
            positionY: markPosition.y,
            targetIndex: nearTargetIndex,
            distanceToCenter: markToNearCenterDistance,
            arrowNumber: hits.count,
            shootingNumberInSet: hits.count,
            seriesNumber: seriesNumber ?? nil
        ))
        shots.append(getHitScoreString(hit: hits.last!))
        markVisibility = .gone
        isAiming = false
    }
    
    let targetFace : TargetFaceWAProtocol
    let arrowDiameterMM : Double
    let markOffsetY : Double
    let scaleRatio: Double
    let shotsMaxNumber : Int
    let shotsPerTargetNumber : Int
    let seriesNumber : Int?
    
    @Published var geometrySize : CGSize
    @Published var isAiming : Bool = false
    
    static let sampleViewModel =  ShootingViewModel(
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
        seriesNumber: 2
    )
    
    // MARK: - public computed variables
     var hitIndexesAtNearTarget : [Int] {
        var indexesAtNearTarget : [Int] = []
        for hitIndex in 0..<hits.count {
            if nearTargetIndex == hits[hitIndex].targetIndex && hits[hitIndex].isAtTarget{
                indexesAtNearTarget.append(hitIndex)
            }
        }
        
        return indexesAtNearTarget.sorted { hits[$0].distanceToCenter < hits[$1].distanceToCenter }
    }
    
    var scaleToDisplay : Double {
        if geometrySize.equalTo(CGSize.zero) {
            return 1
        } else {

            return targetFace.scheme != .vertical ? min(geometrySize.width, geometrySize.height) * 0.85 / targetsFrame.width : max(geometrySize.width, geometrySize.height) * 0.85 / targetsFrame.height
        }
    }
    
    var targetSheetCenterPosition : CGPoint {
        if geometrySize.equalTo(CGSize.zero) {
            return CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.maxY + targetFullDiameterMM)
        } else {
            return CGPoint(x: geometrySize.width / 2, y: geometrySize.height / 2)
        }
    }
    
    var aimingScale : Double {
        scaleRatio / scaleToDisplay
    }
    
    var markPoint: UnitPoint {
        UnitPoint(
           x: markPosition.x / geometrySize.width,
           y: markPosition.y / geometrySize.height
        )
    }
    
    var markCircleSize: CGFloat {
        arrowDiameterMM * scaleToDisplay * aimingScale
    }
    
    var markScoreText: String {
        "\(markScore.toString(centerScoreStyle: targetFace.centerScoreStyle ))"
    }
    
    var markScoreFontSize: CGFloat {
        arrowDiameterMM * 3.7
    }
    
    var markPosition : CGPoint {
        CGPoint(x: fingerPosition?.x ?? 0, y: (fingerPosition?.y ?? 0) + markOffsetY)
    }
    
// MARK: - private variables
    
    
    /* private */ var hits : [Hit] = []
    private var fingerPosition : CGPoint?
    
    private var markToNearCenterDistance : Double {
        guard isAiming else {return Double.infinity}
        return markTargetCentersDistance[nearTargetIndex]
    }
    
    
    
    private var targetsFrame : CGSize{
        getTargetSheetSize(targetFace: targetFace)
    }
    
    private var markTargetCentersDistance : [Double] {
        var result : [Double] = []
        for targetCenter in targetCenters {
            result.append(
                sqrt(
                    pow(
                        markPosition.x - (targetSheetCenterPosition.x + targetCenter.x * scaleToDisplay),
                        2
                    ) + pow(
                        markPosition.y - (targetSheetCenterPosition.y + targetCenter.y * scaleToDisplay),
                        2
                    )
                ) / scaleToDisplay
            )
        }
        
        return result
    }
    
    private var nearTargetIndex : Int {
        guard let minimalDistance = markTargetCentersDistance.min() else { return 0}
        return markTargetCentersDistance.firstIndex(of: minimalDistance) ?? 0
    }
    
    private var markScore : TargetScoreZone {
        var result = TargetScoreZone.miss
        for targetZone in targetFace.targetScoreZones {
            if (targetZone.ratioToFullDiameter() * targetFace.fullDiameterMM.toDouble() + arrowDiameterMM) / 2  >= markTargetCentersDistance[nearTargetIndex] {
                result = targetZone
            }
        }
        return result
    }
    
    private var targetMaxDiameter : Double {
        targetFace.maxDiameterMM
    }
    
    private var targetCenters : [CGPoint] {
        getTargetCentersPosition(targetFace: targetFace)
    }
    
    private var arrowsCountAtNearTarget : Int {
        var result = 0
        for hit in hits {
            if hit.targetIndex == nearTargetIndex {
                result += 1
            }
        }
        return result
    }
    
    private var targetIsBusy : Bool {
        arrowsCountAtNearTarget >= shotsPerTargetNumber
    }
    
    private var hitIsAtTarget : Bool {
        markToNearCenterDistance <= (targetMaxDiameter + arrowDiameterMM) / 2
    }
 
    
  
    // MARK:  - initialization 
    init(
        targetFace : TargetFaceWA,
        arrowDiameterMM : Double,
        markOffsetY : Double,
        scaleRatio: Double,
        shotsMaxNumber : Int,
        shotsPerTargetNumber : Int,
        seriesNumber : Int?
    ) {
        self.targetFace = targetFace
        self.arrowDiameterMM = arrowDiameterMM
        self.markOffsetY = markOffsetY
        self.scaleRatio = scaleRatio
        self.shotsMaxNumber = shotsMaxNumber
        self.shotsPerTargetNumber = shotsPerTargetNumber
        self.seriesNumber = seriesNumber

        
        self.isTargetSheetVisible = false
        self.markVisibility = .gone
        
        self.targetFullDiameterMM = targetFace.fullDiameterMM.toDouble()
        
        self.geometrySize = CGSize.zero
    }
    
    
    // MARK: - Private func
    
    private func getHitScoreString(hit: Hit) -> String {
        switch hit.score {
        case 0:
            return "M"
        case 10 where targetFace.centerScoreStyle == .withX && hit.isSmallTen:
            return "X"
        default:
            return String(hit.score)
        }
    }
    
    
    private func getTargetSheetSize (targetFace: TargetFaceWAProtocol) -> CGSize {
        switch targetFace.scheme {
        case .one:
            return CGSize(width: targetFace.maxDiameterMM, height: targetFace.maxDiameterMM)
        case .vegas:
            let triangleHeight = targetFace.centersDistance * sqrt(3) / 2
            return CGSize(
                width: targetFace.centersDistance + targetFace.maxDiameterMM,
                height: triangleHeight + targetFace.maxDiameterMM
            )
        case .vertical:
            return CGSize(
                width: targetFace.maxDiameterMM,
                height: targetFace.centersDistance * 2 + targetFace.maxDiameterMM
            )
        }
    }
    
    private func getTargetCentersPosition (targetFace: TargetFaceWAProtocol) -> [CGPoint] {
        var centersPosition : [CGPoint] = []
        
        let targetCentersDistance = targetFace.centersDistance
        
        switch targetFace.scheme {
        case .one:
            centersPosition.append(CGPoint.zero)
        case .vegas:
            let triangleHeight = targetCentersDistance * sqrt(3) / 2
            centersPosition.append(CGPoint(x: targetCentersDistance / -2, y: triangleHeight / 2))
            centersPosition.append(CGPoint(x: 0, y: triangleHeight / -2))
            centersPosition.append(CGPoint(x: targetCentersDistance / 2, y: triangleHeight / 2))
        case .vertical:
            centersPosition.append(CGPoint(x: 0, y: -targetCentersDistance))
            centersPosition.append(CGPoint(x: 0, y: 0))
            centersPosition.append(CGPoint(x: 0, y: targetCentersDistance))
        }
        
        return centersPosition
    }
    
}
