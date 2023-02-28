//
//  GameDetailRouter.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 15/02/23.
//

import UIKit

class GameDetailRouter: NSObject {
    
    var presenter: GameDetailPresenterInterface!
    private weak var viewController: GameDetailViewController?
    
    static func setupModule() -> GameDetailViewController {
        let vc = GameDetailViewController()
        let interactor = GameDetailInteractor()
        let router = GameDetailRouter()
        let presenter = GameDetailPresenter(interactor: interactor, router: router, view: vc)
        vc.presenter = presenter
        router.presenter = presenter
        interactor.output = presenter
        return vc
    }
}
