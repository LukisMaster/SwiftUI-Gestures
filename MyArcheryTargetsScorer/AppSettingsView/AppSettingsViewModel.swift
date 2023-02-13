//
//  AppSettingsViewModel.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 27.01.2023.
//

import SwiftUI
import CoreData

protocol AppSettingsViewModelProtocol {
    var firstName: String { get }
    var lastName: String { get }
    var birthday: Date { get }
    var club: String { get }
    func changeSettings ()
}

class AppSettingsViewModel: AppSettingsViewModelProtocol, ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var birthday: Date = Date()
    @Published var club: String = ""
        
    //CoreData
    private let coreDataManager = CoreDataManager.instance
    
    init () {
        getSettings()
    }
    
    private func getSettings () {
        let request = NSFetchRequest<UserProfileEntity>(entityName: "UserProfileEntity")
        do {
            let userProfile = try coreDataManager.context.fetch(request)
            firstName = userProfile.first?.firstName ?? ""
            lastName = userProfile.first?.lastName ?? ""
            birthday = userProfile.first?.birthday ?? Date()
            club = userProfile.first?.club ?? ""
        } catch {
            print("Error fetching \(error). \n\(error.localizedDescription)")
        }
    }
    
    func changeSettings() {
        saveData()
    }
    
    private func saveData() {
        coreDataManager.save()
    }
}
