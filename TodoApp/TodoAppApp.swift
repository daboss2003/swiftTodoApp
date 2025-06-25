//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Samson Oluwafemi on 02/04/2025.
//

import SwiftUI

@main
struct TodoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
