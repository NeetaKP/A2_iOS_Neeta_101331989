//
//  CoreDataManager.swift
//  LabAssignment-2
//
//  Created by Niko Pant on 2025-03-22.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "ProductDB")
        persistentContainer.loadPersistentStores {_, error in if let error = error {
            fatalError("Failed to load store: \(error)")
        }}
    }
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            try? context.save()
        }
    }
}
