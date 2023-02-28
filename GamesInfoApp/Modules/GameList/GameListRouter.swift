//
//  GameListRouter.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 15/02/23.
//

import UIKit

protocol GameListRouterInterface {
    func navigateToGameDetail(gameId: Int)
}

class GameListRouter: NSObject {
    
    var presenter: GameListPresenterInterface!
    private weak var viewController: GameListViewController?
    
    static func setupModule() -> GameListViewController {
        let vc = GameListViewController()
        let interactor = GameListInteractor()
        let router = GameListRouter()
        let presenter = GameListPresenter(interactor: interactor, router: router, view: vc)
        vc.presenter = presenter
        router.presenter = presenter
        interactor.output = presenter
        router.viewController = vc
        return vc
    }
    
}

extension GameListRouter: GameListRouterInterface {
    func navigateToGameDetail(gameId: Int) {
        let vc = GameDetailRouter.setupModule()
        vc.gameId = gameId
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

