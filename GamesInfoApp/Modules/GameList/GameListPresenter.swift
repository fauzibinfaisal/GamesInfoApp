//
//  GameListPresenter.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 16/02/23.
//

import Foundation

protocol GameListPresenterInterface {
    func viewDidAppear ()
    func rowTapped (gameId: Int)
    func getNumberOfRows () -> Int
    func getGameItem (at index: Int) -> GameListEntity
    func getNextGameList (page: Int, count: Int)
    
}

class GameListPresenter {
    
    var view: GameListViewControllerInterface?
    let router: GameListRouterInterface?
    let interactor: GameListInteractorInterface?
    var gameList = [GameListEntity]()
    
    init(interactor: GameListInteractorInterface, router: GameListRouterInterface, view: GameListViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension GameListPresenter: GameListPresenterInterface {
    
    func viewDidAppear() {
        DispatchQueue.main.async {
            self.interactor?.fetchGameList()
        }
    }
    
    func rowTapped(gameId: Int) {
        router?.navigateToGameDetail(gameId: gameId)
    }
    
    func getNumberOfRows() -> Int {
        return gameList.count
    }
    
    func getGameItem(at index: Int) -> GameListEntity {
        return gameList[index]
    }
    
    func getNextGameList(page: Int, count: Int) {
        self.interactor?.fetchGameList(page: page, count: count)
    }
    
}

extension GameListPresenter : GameListInteractorOutputProtocol{
    
    func gameListFetchedSuccessfully(gameList: [GameListEntity]) {
        self.gameList = gameList
        view?.setupTableView()
        view?.reloadTableView()
    }
    
    func gameListFetchingFailed(error: Error) {
        print(error.localizedDescription)
        
    }
    
    func nextGameListFetchedSuccessfully(gameList: [GameListEntity]) {
        self.gameList.append(contentsOf: gameList)
    }
    
    func nextListFetchingFailed(error: Error) {
        print(error.localizedDescription)
    }
}
