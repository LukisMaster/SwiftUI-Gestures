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
//    func presentView (menuIndex: Int) -> some View // обязательная функция!, но вызывает ошибку, если объявить в протоколе
}

final class HomeViewModel: ObservableObject {
    
    struct MenuLabel {
        let image: String?
        let string: String?
    }
    
    enum MenuPresentView: Int {
        case competitionRounds
        case freeTrainings
        case appSettings
        case archeryEquipment
        
        @ViewBuilder func toView() -> some View {
            switch self {
            case .competitionRounds:
                 SessionSettingsView()
            case .freeTrainings:
                 SessionSettingsView()
            case .appSettings:
                AppSettingsView(viewModel: AppSettingsViewModel())
            case .archeryEquipment:
                ArcheryEquipmentsView()
            }
        }
    }
    
    private let menuLabels : [MenuLabel] = [
        MenuLabel(image: nil, string: "Competition rounds"),
        MenuLabel(image: nil, string: "Free training"),
        MenuLabel(image: nil, string: "App settings"),
        MenuLabel(image: nil, string: "Archery equipment")
    ]
    
}

//MARK: -

extension HomeViewModel: HomeViewModelProtocol {
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
    
    func presentView (menuIndex: Int) -> some View {
        return MenuPresentView(rawValue: menuIndex)?.toView()
    }
    
}
