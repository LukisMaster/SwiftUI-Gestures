//
//  CoreDataViewModel.swift
//  SwiftUI Gestures
//
//  Created by Sergey Nestroyniy on 26.11.2022.
//

import CoreData

class CoreDataViewModel : ObservableObject {
    
    let container : NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "LukisArcheryScorer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error.localizedDescription)")
            }
        }
    }
}
