//
//  GameListInteractor.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 15/02/23.
//

protocol GameListInteractorInterface {
    func fetchGameList()
    func fetchGameList(page: Int, count: Int)
}

protocol GameListInteractorOutputProtocol {
    func gameListFetchedSuccessfully(gameList: [GameListEntity])
    func gameListFetchingFailed(error: Error)
    func nextGameListFetchedSuccessfully(gameList: [GameListEntity])
    func nextListFetchingFailed(error: Error)

}

final class GameListInteractor {
    var output: GameListInteractorOutputProtocol?
    var apiService: ApiService = ApiService()
    
}

extension GameListInteractor: GameListInteractorInterface {

    func fetchGameList() {
        apiService.getGamesList() { [weak self] result in
            switch result {
            case .success(let response):
                let gameList = response.results.map {
                    GameListEntity(
                        id: $0.id,
                        backgroundImage: $0.backgroundImage,
                        name: $0.name,
                        released: $0.released,
                        rating: $0.rating)}
                self?.output?.gameListFetchedSuccessfully(gameList: gameList)
            case .failure(let error):
                self?.output?.gameListFetchingFailed(error: error)
            }
        }
    }
    
    func fetchGameList(page: Int, count: Int) {
        apiService.getGamesList(page: page, count: count) { [weak self] result in
            switch result {
            case .success(let response):
                let gameList = response.results.map {
                    GameListEntity(
                        id: $0.id,
                        backgroundImage: $0.backgroundImage,
                        name: $0.name,
                        released: $0.released,
                        rating: $0.rating)}
                self?.output?.nextGameListFetchedSuccessfully(gameList: gameList)
            case .failure(let error):
                self?.output?.nextListFetchingFailed(error: error)
            }
        }
    }
}
