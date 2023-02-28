//
//  GameListEntity.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 15/02/23.
//

struct GameListEntity {
    let id: Int
    let backgroundImage: String?
    let name: String
    let released: String?
    let rating: Double?
}

extension GameListEntity {
    func tranform() -> GameCellModel {
        return GameCellModel(
            id: self.id,
            backgroundImage: self.backgroundImage ?? "",
            name: self.name ,
            released: self.released ?? "-",
            rating: self.rating)
    }
}
