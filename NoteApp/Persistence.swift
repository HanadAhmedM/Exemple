//
//  Persistence.swift
//  NoteApp
//
//  Created by Hanad.Ahmed on 2024-03-06.
//

import Foundation
import CoreData

struct Persistence {
    static let shared = Persistence()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "NoteModel")

        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack with error: \(error)")
            } else {
                print("Core Data stack loaded successfully")
            }
        }
    }
}
