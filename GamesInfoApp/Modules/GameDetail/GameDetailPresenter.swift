//
//  GameDetailPresenter.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 15/02/23.
//

import Foundation

protocol GameDetailPresenterInterface {
    func viewDidAppear()
    func starTapped(game: GameDetailEntity, isFavorite: Bool)
    func getGameDetail(id: Int)
    func getIsFavorite(id: Int)
}

class GameDetailPresenter {
    
    var view: GameDetailViewControllerInterface?
    let router: GameDetailRouter?
    let interactor: GameDetailInteractorInterface?
    
    init(interactor: GameDetailInteractorInterface, router: GameDetailRouter, view: GameDetailViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension GameDetailPresenter: GameDetailPresenterInterface {
    
    func viewDidAppear() {
    }
    
    func getGameDetail(id: Int) {
        DispatchQueue.main.async {
            self.interactor?.fetchGameDetail(id: id)
        }
    }
    func starTapped(game: GameDetailEntity, isFavorite: Bool) {
        isFavorite ? self.interactor?.addFavorite(game: game) : self.interactor?.removeFavorite(id: game.id)
    }
    
    func getIsFavorite(id: Int) {
        DispatchQueue.main.async {
            self.interactor?.fetchGameFavorite(id: id)
        }
    }
    
}

extension GameDetailPresenter : GameDetailInteractorOutputProtocol{
    func gameDetailFetchedSuccessfully(gameDetail: GameDetailEntity) {
        view?.showGameDetail(game: gameDetail)
    }
    
    func gameDetailFetchingFailed(error: Error) {
        print(error.localizedDescription)
        
    }
    
    func gameFavoriteFetchedSuccessfully(isFavorite: Bool) {
        view?.toggleFavorite(isFavorite: isFavorite)
    }
    
    func gameFavoriteFetchingFailed(error: Error) {
        print(error.localizedDescription)
    }
    
    func gameDetailAddedSuccessfully() {}
    
    func gameDetailAddingFailed(error: Error) {
        print(error.localizedDescription)

    }
    
    func gameDetailRemovedSuccessfully() {}
    
    func gameDetailRemovingFailed(error: Error) {
        print(error.localizedDescription)
    }
}
