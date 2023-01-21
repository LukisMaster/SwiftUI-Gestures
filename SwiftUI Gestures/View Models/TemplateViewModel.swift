//
//  TemplateViewModel.swift
//  SwiftUI Gestures
//
//  Created by Sergey Nestroyniy on 20.01.2023.
//

import Combine
import CoreData

class TemplateViewModel: ObservableObject {
    let coreManager = CoreDataManager.instance
    @Published var hits: [HitEntity] = []
    
    func addHit() {
        let newHit = HitEntity(context: coreManager.context)
        newHit.isAtTarget
        // и т.д.
        //
        //
        save()
    }
    
    func save() {
        coreManager.save()
    }
    
}
