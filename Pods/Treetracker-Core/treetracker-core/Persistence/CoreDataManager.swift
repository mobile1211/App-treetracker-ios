//
//  CoreDataManager.swift
//  TreeTracker
//
//  Created by Alex Cornforth on 30/06/2020.
//  Copyright © 2020 Greenstand. All rights reserved.
//

import CoreData

public protocol CoreDataManaging {
    var viewContext: NSManagedObjectContext { get }
    func saveContext()
    func perform<T: NSFetchRequestResult>(fetchRequest: NSFetchRequest<T>) -> [T]?
}

class CoreDataManager: CoreDataManaging {

    private lazy var persistentContainer: NSPersistentContainer = {

        let bundle = Bundle(for: CoreDataManager.self)

        guard let modelURL = bundle.url(forResource: "TreeTracker", withExtension: "momd") else {
            fatalError("Unable to load managed object model URL")
        }

        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to load managed object model: \(modelURL)")
        }

        let container = NSPersistentContainer(name: "TreeTracker", managedObjectModel: managedObjectModel)
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func perform<T: NSFetchRequestResult>(fetchRequest: NSFetchRequest<T>) -> [T]? {
        do {
            let result = try viewContext.fetch(fetchRequest)
            return result
        } catch {
            return nil
        }
    }
}
