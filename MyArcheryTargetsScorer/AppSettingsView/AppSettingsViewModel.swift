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
}

class AppSettingsViewModel: AppSettingsViewModelProtocol, ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var birthday: Date = Date()
    @Published var club: String = ""
}
