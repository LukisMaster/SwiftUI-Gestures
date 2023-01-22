//
//  RoundRules.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 21.01.2023.
//

protocol RoundRulesProtocol {
    var maxSeriesNumber: Int { get }
    var maxHitsNumberInSeries: Int { get }
    var maxHitsNumberInTarget: Int { get }
}

struct RoundRules: RoundRulesProtocol {
    let maxSeriesNumber: Int
    let maxHitsNumberInSeries: Int
    let maxHitsNumberInTarget: Int
}

