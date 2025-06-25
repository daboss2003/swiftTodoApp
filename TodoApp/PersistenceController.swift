//
//  PersistenceController.swift
//  TodoApp
//
//  Created by Samson Oluwafemi on 02/04/2025.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "TodoItem") // Ensure this matches your .xcdatamodeld filename
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
}
