//
//  ToDoListItem+Extensions.swift
//  TodoApp
//
//  Created by Samson Oluwafemi on 02/04/2025.
//

import Foundation
import CoreData

//class ToDoListItem: NSManagedObject, Identifiable{
//    @NSManaged var name: String?
//    @NSManaged var createdAt: Date?
//}


extension ToDoListItem{
    static func getAllTodoItems() -> NSFetchRequest<ToDoListItem>{
        let request: NSFetchRequest<ToDoListItem> = ToDoListItem.fetchRequest()
        let sort = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sort]
        return request
    }
}
