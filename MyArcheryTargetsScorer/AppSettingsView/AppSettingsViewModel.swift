//
//  AppSettingsViewModel.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 27.01.2023.
//

import SwiftUI

protocol AppSettingsViewModelProtocol {
    var firstName: String { get }
    var lastName: String { get }
    var birthday: Date { get }
    var club: String { get }
    var selectedColorScheme: Color.AppThemes { get }
    var colorSchemes: [Color.AppThemes] { get }
}

class AppSettingsViewModel: AppSettingsViewModelProtocol, ObservableObject {
    let colorSchemes: [Color.AppThemes] = Color.AppThemes.allCases
    
    @Published var selectedColorScheme: Color.AppThemes = .red {
        didSet {
            changeColorScheme(to: selectedColorScheme)
        }
    }
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var birthday: Date = Date()
    @Published var club: String = ""
    
    private func changeColorScheme(to colorName: Color.AppThemes) {
        switch colorName {
        case  .red:
            break
        case .green:
            break
        case .blue:
            break
        case .gray:
            break
        }
    }
}
