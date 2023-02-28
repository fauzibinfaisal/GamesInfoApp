//
//  CoreDataManager.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 16/02/23.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GamesInfoApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("Saved")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func addGameObject(data: GameDetailEntity) -> Result <GameObject, Error> {
        let context = persistentContainer.viewContext
        
        let gameObject = GameObject(context: context)
        gameObject.id = Int16(data.id)
        gameObject.name = data.name
        gameObject.backgroundImage = data.backgroundImage ?? ""
        gameObject.rating = data.rating ?? 0.0
        gameObject.released = data.released ?? "-"
        gameObject.publishers = data.publishers ?? "-"
        gameObject.playtime = Int16(data.playtime)
        gameObject.gameDescription = data.gameDescription
        
        do {
            try context.save()
            return .success(gameObject)
        } catch let error {
            return .failure(error)
        }
    }
    
    func removeGameObject(gameObject: GameObject) -> Result <GameObject, Error>  {
        let context = persistentContainer.viewContext
        context.delete(gameObject)
        
        do {
            try context.save()
            return .success(gameObject)
        } catch let error {
            return .failure(error)
        }
    }
    
    func removeGameObject(id: Int) -> Result<Void, Error> {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GameObject>(entityName: "GameObject")
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        do {
            let objects = try context.fetch(fetchRequest)
            if let gameObject = objects.first {
                context.delete(gameObject)
                save()
                return .success(())
            } else {
                return .failure(NSError(domain: "CoreDataManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "GameObject with id \(id) not found."]))
            }
        } catch let error {
            return .failure(error)
        }
    }
    
    func getAllGameObjects() -> Result <[GameObject], Error>  {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GameObject>(entityName: "GameObject")
        do {
            let gameObjects = try context.fetch(fetchRequest)
            return .success(gameObjects)
        } catch let error {
            print("Error fetching game objects: \(error)")
            return .failure(error)
        }
    }
    
    func getGameObjectById(id: Int16) -> Result <GameObject?, Error>  {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GameObject>(entityName: "GameObject")
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        do {
            let gameObjects = try context.fetch(fetchRequest)
            return .success(gameObjects.first)
        } catch let error {
            print("Error fetching game objects: \(error)")
            return .failure(error)
        }
    }
}
