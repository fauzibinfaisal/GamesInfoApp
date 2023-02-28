//
//  GameFavoriteEntity.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 16/02/23.
//

import Foundation

struct GameFavoriteEntity {
    let id: Int
    let backgroundImage: String?
    let name: String
    let released: String?
    let rating: Double?
}

extension GameFavoriteEntity {
    func tranform() -> GameCellModel {
        return GameCellModel(
            id: self.id,
            backgroundImage: self.backgroundImage ?? "",
            name: self.name ,
            released: self.released ?? "-",
            rating: self.rating)
    }
}
