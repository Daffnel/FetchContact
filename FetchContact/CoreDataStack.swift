//
//  CoreDataStack.swift
//  FetchContact
//
//  Created by Daniel A on 2025-04-24.
//

import Foundation
import CoreData

class CoreDataStack{
    
    private let persistentContainer: NSPersistentContainer
    
    var managedObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    init(modelName: String){
        persistentContainer = {
            let container  = NSPersistentContainer(name: modelName)
            container
                .loadPersistentStores { description, error in
                    if let error = error {
                        print(error)
                    }
                }
            return container
        }()
    }
    
    func save(){
        guard managedObjectContext.hasChanges else { return }
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
    }
}
