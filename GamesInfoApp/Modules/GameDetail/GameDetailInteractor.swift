//
//  GameDetailInteractor.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 15/02/23.
//

protocol GameDetailInteractorInterface {
    func fetchGameDetail(id: Int)
    func fetchGameFavorite(id: Int)
    func addFavorite(game: GameDetailEntity)
    func removeFavorite(id: Int)
}

protocol GameDetailInteractorOutputProtocol {
    func gameDetailFetchedSuccessfully(gameDetail: GameDetailEntity)
    func gameDetailFetchingFailed(error: Error)
    func gameFavoriteFetchedSuccessfully(isFavorite: Bool)
    func gameFavoriteFetchingFailed(error: Error)
    func gameDetailAddedSuccessfully()
    func gameDetailAddingFailed(error: Error)
    func gameDetailRemovedSuccessfully()
    func gameDetailRemovingFailed(error: Error)
}

final class GameDetailInteractor {
    var output: GameDetailInteractorOutputProtocol?
    var apiService: ApiService = ApiService()
    var coreDataManager: CoreDataManager = CoreDataManager.shared
    
}

extension GameDetailInteractor: GameDetailInteractorInterface {
    func fetchGameFavorite(id: Int) {
        let result = coreDataManager.getGameObjectById(id: Int16(id))
        switch result {
        case .success(let gameObject):
            if let _ = gameObject {
                self.output?.gameFavoriteFetchedSuccessfully(isFavorite: true)
            } else {
                self.output?.gameFavoriteFetchedSuccessfully(isFavorite: false)
            }
        case .failure(let error):
            print("Error adding game object: \(error)")
            self.output?.gameDetailAddingFailed(error: error)
        }
    }
    

    func fetchGameDetail(id: Int) {
        apiService.getGameDetail(id: id) { [weak self] result in
            switch result {
            case .success(let response):
                let gameDetail = GameDetailEntity(
                    id: response.id,
                    backgroundImage: response.backgroundImage,
                    name: response.name,
                    released: response.released,
                    rating: response.rating,
                    publishers: response.publishers?.first?.name ?? "-",
                    playtime: response.playtime,
                    gameDescription: response.description ?? "-" )
                self?.output?.gameDetailFetchedSuccessfully(gameDetail: gameDetail)
            case .failure(let error):
                self?.output?.gameDetailFetchingFailed(error: error)
            }
        }
    }
    
    func addFavorite(game: GameDetailEntity) {
        let result = coreDataManager.addGameObject(data: game)
        switch result {
        case .success(let gameObject):
            print("Successfully added game object: \(gameObject)")
            self.output?.gameDetailAddedSuccessfully()
        case .failure(let error):
            print("Error adding game object: \(error)")
            self.output?.gameDetailAddingFailed(error: error)
        }
    }
    
    func removeFavorite(id: Int) {
        let result = coreDataManager.removeGameObject(id: id)
        switch result {
        case .success:
            print("Successfully remove game object \(id)")
            self.output?.gameDetailAddedSuccessfully()
        case .failure(let error):
            print("Error adding game object: \(error)")
            self.output?.gameDetailAddingFailed(error: error)
        }
    }
}
