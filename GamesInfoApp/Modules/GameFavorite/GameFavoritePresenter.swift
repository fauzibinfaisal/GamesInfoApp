//
//  GameDetailPresenter.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 15/02/23.
//

import Foundation

protocol GameFavoritePresenterInterface {
   func viewDidAppear()
   func rowTapped(gameId: Int)
   func getNumberOfRows() -> Int
   func getGameItem(at index: Int) -> GameFavoriteEntity
}

class GameFavoritePresenter {

    var view: GameFavoriteViewControllerInterface?
    let router: GameFavoriteRouterInterface?
    let interactor: GameFavoriteInteractorInterface?
    var gameFavorite = [GameFavoriteEntity]()

    init(interactor: GameFavoriteInteractorInterface, router: GameFavoriteRouterInterface, view: GameFavoriteViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension GameFavoritePresenter: GameFavoritePresenterInterface {
    func viewDidAppear() {
        DispatchQueue.main.async {
            self.interactor?.fetchGameFavorite()
        }
    }
    
    func rowTapped(gameId: Int) {
        router?.navigateToGameDetail(gameId: gameId)
    }
    
    func getNumberOfRows() -> Int {
        return gameFavorite.count
    }
    
    func getGameItem(at index: Int) -> GameFavoriteEntity {
        return gameFavorite[index]
    }

}

extension GameFavoritePresenter : GameFavoriteInteractorOutputProtocol{
    
    func gameFavoriteFetchedSuccessfully(gameFavorite: [GameFavoriteEntity]) {
        self.gameFavorite = gameFavorite
        view?.setupTableView()
        view?.reloadTableView()
    }
    
    func gameFavoriteFetchingFailed(error: Error) {
        print(error.localizedDescription)

    }
}
