//
//  CoreDataManager.swift
//  SwiftUI Gestures
//
//  Created by Sergey Nestroyniy on 26.11.2022.
//

import CoreData


class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    var viewContext : NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    private init () {
        persistentContainer = NSPersistentContainer(name: "LukisArcheryScorer")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
    }
    
}
