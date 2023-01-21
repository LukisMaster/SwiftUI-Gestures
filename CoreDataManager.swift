//
//  CoreDataManager.swift
//  SwiftUI Gestures
//
//  Created by Sergey Nestroyniy on 20.01.2023.
//

import CoreData

final class CoreDataManager {
    
    static let instance = CoreDataManager()
    let container : NSPersistentContainer
    let context : NSManagedObjectContext
    
    init () {
        container = NSPersistentContainer(name: "LukisArcheryScorer")
        container.loadPersistentStores { description, error in
            if  let error = error {
                fatalError("Error load Core Data \n\(error) \n\(error.localizedDescription)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("Data saved successfully")
        } catch {
            context.rollback()
            print("Error save Core Data \n\(error) \n\(error.localizedDescription)")
        }
    }
}
