//
//  GameFavoriteRouter.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 16/02/23.
//

import UIKit

protocol GameFavoriteRouterInterface {
    func navigateToGameDetail(gameId: Int)
}

class GameFavoriteRouter: NSObject {
    
    var presenter: GameFavoritePresenterInterface!
    private weak var viewController: GameFavoriteViewController?
    
    static func setupModule() -> GameFavoriteViewController {
        let vc = GameFavoriteViewController()
        let interactor = GameFavoriteInteractor()
        let router = GameFavoriteRouter()
        let presenter = GameFavoritePresenter(interactor: interactor, router: router, view: vc)
        vc.presenter = presenter
        router.presenter = presenter
        interactor.output = presenter
        router.viewController = vc
        return vc
    }
    
}

extension GameFavoriteRouter: GameFavoriteRouterInterface {
    func navigateToGameDetail(gameId: Int) {
        let vc = GameDetailRouter.setupModule()
        vc.gameId = gameId
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
