//
//  TargetView.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 21.11.2022.
//

import Foundation

enum CenterScoreStyle: Int16 {
    case withEleven = 0
    case withX = 1
    case onlyTen = 2
    case onlySmallTen = 3
}

enum FullDiameterMM : Int16 {
    case d400 = 0
    case d600 = 1
    case d800 = 2
    case d1220 = 3
    
    func toDouble() -> Double {
        switch self {
        case .d400:
            return 400
        case .d600:
            return 600
        case .d800:
            return 800
        case .d1220:
            return 1220
        }
    }
}

enum SchemeOnSheet: Int16 {
    case one = 0
    case vertical = 1
    case vegas = 2
    
    func toInt() -> Int {
        switch self {
        case .one:
            return 1
        case .vertical:
            return 3
        case .vegas:
            return 3
        }
    }
}

protocol TargetFaceWAProtocol {
    var fullDiameterMM: FullDiameterMM { get }
    var zonesTenTo: Int { get }
    var centerScoreStyle: CenterScoreStyle { get }
    var centerCrosshairSize: Double { get }
    var scheme: SchemeOnSheet { get }
    var maxDiameterMM: Double { get }
    var spacing: Double { get }
    var centersDistance: Double { get }
    var targetScoreZones: [TargetScoreZone] { get }

}

struct TargetFaceWA: TargetFaceWAProtocol {
    
    let fullDiameterMM: FullDiameterMM
    let zonesTenTo: Int
    let centerScoreStyle: CenterScoreStyle
    let centerCrosshairSize: Double
    let scheme: SchemeOnSheet
    
    var maxDiameterMM: Double {
        let minimalZone = TargetScoreZone.fromInt(zonesTenTo)
        return fullDiameterMM.toDouble() * minimalZone.ratioToFullDiameter()
    }
    
    let spacing: Double
    
    var centersDistance: Double {
        maxDiameterMM + spacing
    }
    
    var targetScoreZones: [TargetScoreZone] {
        var scoreZones : [TargetScoreZone]
        switch centerScoreStyle {
        case .onlyTen:
            scoreZones = TargetScoreZone.allCases.filter { $0 != .smallTen }
        case .onlySmallTen:
            scoreZones = TargetScoreZone.allCases.filter { $0 != .ten }
        default:
            scoreZones = TargetScoreZone.allCases
        }
        scoreZones = scoreZones.filter { $0.toInt(centerScoreStyle: centerScoreStyle) >= zonesTenTo }
        return scoreZones.sorted { $0.ratioToFullDiameter() > $1.ratioToFullDiameter()
        }
        
    }
    
}

//MARK: - Presets for target face
extension TargetFaceWA {
    static let wa40 = TargetFaceWA(fullDiameterMM: .d400, zonesTenTo: 1, centerScoreStyle: .onlySmallTen, centerCrosshairSize: 4, scheme: .one, spacing: 0)
    static let wa80to5 = TargetFaceWA(fullDiameterMM: .d400, zonesTenTo: 5, centerScoreStyle: .withX, centerCrosshairSize: 4, scheme: .one, spacing: 0)
    static let wa40vegas = TargetFaceWA(fullDiameterMM: .d400, zonesTenTo: 6, centerScoreStyle: .withEleven, centerCrosshairSize: 4, scheme: .vegas, spacing: 20)
    static let wa40vertical = TargetFaceWA(fullDiameterMM: .d400, zonesTenTo: 6, centerScoreStyle: .onlyTen, centerCrosshairSize: 4, scheme: .vertical, spacing: 20)
}
