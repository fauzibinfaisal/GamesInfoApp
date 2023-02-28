//
//  GameFavoriteInteractor.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 16/02/23.
//

import Foundation

protocol GameFavoriteInteractorInterface {
    func fetchGameFavorite()
}

protocol GameFavoriteInteractorOutputProtocol {
    func gameFavoriteFetchedSuccessfully(gameFavorite: [GameFavoriteEntity])
    func gameFavoriteFetchingFailed(error: Error)
}

final class GameFavoriteInteractor {
    var output: GameFavoriteInteractorOutputProtocol?
    var apiService: ApiService = ApiService()
    var coreDataManager: CoreDataManager = CoreDataManager.shared
    
}

extension GameFavoriteInteractor: GameFavoriteInteractorInterface {
    
    func fetchGameFavorite() {
        let result = coreDataManager.getAllGameObjects()
        switch result {
        case .success(let gameObjects):
            print("Successfully fetch game object: \(gameObjects)")
            let gameList: [GameFavoriteEntity] = gameObjects.map { $0.toGameFavoriteEntity() }
            self.output?.gameFavoriteFetchedSuccessfully(gameFavorite: gameList)
        case .failure(let error):
            print("Error fetch game object: \(error)")
            self.output?.gameFavoriteFetchingFailed(error: error)
        }
    }
}
