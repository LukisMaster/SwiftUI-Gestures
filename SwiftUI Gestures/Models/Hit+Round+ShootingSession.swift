//
//  Hit.swift
//  SwiftUI Gestures
//
//  Created by Sergey Nestroyniy on 21.11.2022.
//

import Foundation

enum TypeOfShootingSession : Int16 {
    case freePractice = 0
    case standardTraining = 1
}

struct Hit {
    let score : Int
    let isSmallTen : Bool
    let isAtTarget : Bool
    let positionX : Double
    let positionY : Double
    let targetIndex : Int
    let distanceToCenter : Double
    let arrowNumber : Int
    let shootingNumberInSet : Int
    let seriesNumber : Int?
}

struct Round {
    var series : [[Hit]]
    var targetFace : TargetFaceWAProtocol
    var roundRules : RoundRulesProtocol
}

struct ShootingSession {
    var rounds : [Round]
    var date : Date
    var type : TypeOfShootingSession
}


