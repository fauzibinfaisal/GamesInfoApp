//
//  GameDetailViewController.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 15/02/23.
//

import UIKit

protocol GameDetailViewControllerInterface {
    func showGameDetail(game: GameDetailEntity)
    func toggleFavorite(isFavorite: Bool)
}

class GameDetailViewController: UIViewController {
    var presenter: GameDetailPresenterInterface!
    var gameId: Int!
    var isFavorite = false
    var model: GameDetailEntity?
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var topRoundedView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var playedLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigation()
        self.setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter?.viewDidAppear()
        presenter?.getGameDetail(id: gameId)
        presenter?.getIsFavorite(id: gameId)
    }
    
    // MARK: - Navigation
    private func setupNavigation(){
        // Set the navigation bar appearance
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = UIColor(named: "PrimaryColor")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        self.title = "Detail"
        
        // Set the view background color
        view.backgroundColor = .white
        self.setupToggleButton()
    }
    
    private func setupToggleButton(){
        let starButton = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(toggleFavoriteIconTapped))
        navigationItem.rightBarButtonItem = starButton
    }
    
    @objc func toggleFavoriteIconTapped() {
        if let _ = navigationItem.rightBarButtonItem?.image {
            toggleFavoriteAction()
        }
    }
    
    private func toggleFavoriteAction() {
        isFavorite = !isFavorite
        toggleFavoriteIcon()
        guard let model = model else { return }
        presenter?.starTapped(game: model, isFavorite: isFavorite)
    }
    
    private func toggleFavoriteIcon(){
        navigationItem.rightBarButtonItem?.image =
        isFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
    }
    
    // MARK: - UI
    private func setupUI(){
        topRoundedView.layer.cornerRadius = 20
        topRoundedView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
    }
    
    private func updateData(model: GameDetailEntity){
        self.model = model
        DispatchQueue.main.async {
            self.gameImage.setImage(from: model.backgroundImage ?? "")

            self.typeLabel.text = model.publishers
            self.nameLabel.text = model.name
            self.releaseDateLabel.text = model.released
            self.ratingLabel.text = model.rating != nil ? "\(model.rating!)" : "-"
            self.playedLabel.text = "\(model.playtime) played"
            self.descriptionLabel.attributedText = model.gameDescription.htmlAttributedString()
        }
    }
}

extension GameDetailViewController: GameDetailViewControllerInterface {
    func showGameDetail(game: GameDetailEntity) {
        updateData(model: game)
    }
    
    func toggleFavorite(isFavorite: Bool) {
        self.isFavorite = isFavorite
        toggleFavoriteIcon()
    }
}
