//
//  TargetZone.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 21.11.2022.
//

enum TargetColor {
    case yellowWA
    case redWA
    case blueWA
    case blackWA
    case whiteWA
    case grayBorderWA
}

enum TargetScoreZone: CaseIterable{
    case smallTen
    case ten
    case nine
    case eight
    case seven
    case six
    case five
    case four
    case three
    case two
    case one
    case miss
    
    func toString (centerScoreStyle: CenterScoreStyle) -> String {
        switch self {
        case .smallTen where centerScoreStyle == .withEleven:
            return "11"
        case .smallTen where centerScoreStyle == .withX:
            return "X"
        case .smallTen:
            return "10"
        case .ten:
            return centerScoreStyle == .onlySmallTen ? "9" : "10"
        case .nine:
            return "9"
        case .eight:
            return "8"
        case .seven:
            return "7"
        case .six:
            return "6"
        case .five:
            return "5"
        case .four:
            return "4"
        case .three:
            return "3"
        case .two:
            return "2"
        case .one:
            return "1"
        case .miss:
            return "M"
        }
    }
    
    func toInt (centerScoreStyle: CenterScoreStyle) -> Int {
        switch self {
        case .smallTen:
            return centerScoreStyle == .withEleven ? 11 : 10
        case .ten:
            return centerScoreStyle == .onlySmallTen ? 9 : 10
        case .nine:
            return 9
        case .eight:
            return 8
        case .seven:
            return 7
        case .six:
            return 6
        case .five:
            return 5
        case .four:
            return 4
        case .three:
            return 3
        case .two:
            return 2
        case .one:
            return 1
        case .miss:
            return 0
        }
    }
    
    func toTargetColorWA () -> TargetColor {
        switch self {
        case .smallTen:
            fallthrough
        case .ten:
            fallthrough
        case .nine:
            return .yellowWA
        case .eight:
            fallthrough
        case .seven:
            return .redWA
        case .six:
            fallthrough
        case .five:
            return .blueWA
        case .four:
            fallthrough
        case .three:
            return .blackWA
        case .two:
            fallthrough
        case .one:
            return .whiteWA
        case .miss:
            return .whiteWA
        }
    }
    
    func toBorderColorWA (zonesTenTo: Int) -> TargetColor {
        switch self {
        case .smallTen:
            fallthrough
        case .ten:
            fallthrough
        case .nine:
            fallthrough
        case .eight:
            fallthrough
        case .seven:
            fallthrough
        case .six:
            return .blackWA
        case .five:
            return zonesTenTo == 5 ? .blackWA : .blueWA
        case .four:
            return .whiteWA
        case .three:
            fallthrough
        case .two:
            fallthrough
        case .one:
            fallthrough
        case .miss:
            return .blackWA
        }
    }
    
    func ratioToFullDiameter () -> Double {
        switch self {
        case .smallTen:
            return 0.05
        case .ten:
            return 0.1
        case .nine:
            return 0.2
        case .eight:
            return 0.3
        case .seven:
            return 0.4
        case .six:
            return 0.5
        case .five:
            return 0.6
        case .four:
            return 0.7
        case .three:
            return 0.8
        case .two:
            return 0.9
        case .one:
            return 1.0
        case .miss:
            return Double.infinity
        }
    }
    
    func toBorderWidthMM () -> Double {
        if self.toInt(centerScoreStyle: .onlyTen) % 2 == 1 {
            return 2
        } else {
            return 1
        }
            
    }
    
    static func fromInt (_ number: Int) -> TargetScoreZone {
        switch number {
        case 0:
            return .miss
        case 1:
            return .one
        case 2:
            return .two
        case 3:
            return .three
        case 4:
            return .four
        case 5:
            return .five
        case 6:
            return .six
        case 7:
            return .seven
        case 8:
            return .eight
        case 9:
            return .nine
        case 10:
            return .ten
        case 11:
            return .smallTen
        default:
            return .miss
        }
    }
    
}

protocol TargetZoneProtocol {
    var zoneDiameterMM : Double { get }
    var color: TargetColor { get }
    var borderColor: TargetColor { get }
    var borderWidth: Double { get }
}

struct TargetZone : TargetZoneProtocol {
    let zoneDiameterMM: Double
    let color: TargetColor
    let borderColor: TargetColor
    let borderWidth: Double
}

