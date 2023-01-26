//
//  HomeViewModel.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 24.01.2023.
//

import SwiftUI

protocol HomeViewModelProtocol {
    var mainMenuGridColumns: [GridItem] { get }
    var menuLabelImages: [String] { get }
    var menuLabelTexts: [String] { get }
}

final class HomeViewModel: HomeViewModelProtocol, ObservableObject {
    
    struct MenuLabel {
        let image: String?
        let string: String?
    }
    
    let menuLabels : [MenuLabel] = [
        MenuLabel(image: nil, string: "Competition rounds"),
        MenuLabel(image: nil, string: "Free training"),
        MenuLabel(image: nil, string: "App Settings"),
        MenuLabel(image: nil, string: "Archery Gears")
    ]
    
    var menuLabelImages: [String] {
        var result : [String] = []
        menuLabels.forEach { result.append($0.image ?? "znak-otmeny") }
        return result
    }
    var menuLabelTexts: [String] {
        var result : [String] = []
        menuLabels.forEach { result.append($0.string ?? "") }
        return result
    }

    
    var mainMenuGridColumns: [GridItem] {
        return [GridItem(.flexible(minimum: 100)), GridItem(.flexible(minimum: 100))]
    }
}
