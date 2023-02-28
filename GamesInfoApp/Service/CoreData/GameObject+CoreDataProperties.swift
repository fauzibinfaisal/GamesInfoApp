//
//  GameObject+CoreDataProperties.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 28/02/23.
//
//

import Foundation
import CoreData


extension GameObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameObject> {
        return NSFetchRequest<GameObject>(entityName: "GameObject")
    }

    @NSManaged public var backgroundImage: String?
    @NSManaged public var gameDescription: String?
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var playtime: Int16
    @NSManaged public var publishers: String?
    @NSManaged public var rating: Double
    @NSManaged public var released: String?

}

extension GameObject : Identifiable {

}

extension GameObject {
    func toGameFavoriteEntity() -> GameFavoriteEntity {
        return GameFavoriteEntity(id: Int(self.id),
                                  backgroundImage: self.backgroundImage ?? "",
                                  name: self.name ?? "",
                                  released: self.released ?? "",
                                  rating: self.rating)
    }
}
