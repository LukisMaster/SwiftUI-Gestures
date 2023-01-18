//
//  Hit.swift
//  SwiftUI Gestures
//
//  Created by Sergey Nestroyniy on 21.11.2022.
//

import Foundation

enum TypeOfShootingSession {
    case freePractice
    case standardTraining
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
}

struct Round {
    var series : [[Hit]]
    var seriesCount : Int?
    var targetFace : TargetFaceWA
}

struct ShootingSession {
    var rounds : [Round]
    var date : Date
    var type : TypeOfShootingSession
}


