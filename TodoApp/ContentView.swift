//
//  ContentView.swift
//  TodoApp
//
//  Created by Samson Oluwafemi on 02/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(fetchRequest: ToDoListItem.getAllTodoItems()) var items: FetchedResults<ToDoListItem>
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("New Item")){
                    HStack{
                        TextField("Enter new Item....", text: $text)
                        Button(action: {
                            if !text.isEmpty{
                                let newItem = ToDoListItem(context: context)
                                newItem.name = text
                                newItem.createdAt = Date()
                                do {
                                    try context.save()
                                }
                                catch{
                                    print(error)
                                }
                                text = ""
                            }
                        }, label: {
                            Text("Save")
                        }
                        )
                    }
                }
                Section{
                    ForEach(items){todolistItem in
                        VStack(alignment: .leading){
                            Text("\(todolistItem.name!)")
                                .font(.headline)
                            Text("\(todolistItem.createdAt!)")
                        }
                    }.onDelete(perform: { indexSet in
                        guard let index = indexSet.first else{
                            return
                        }
                        let itemToDelete = items[index]
                        context.delete(itemToDelete)
                        do{
                            try context.save()
                        }
                        catch{
                            print(error)
                        }
                    })
                }
            }.navigationTitle("To Do List")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
