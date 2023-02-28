//
//  GameTableViewCell.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 15/02/23.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        photoImage.layer.cornerRadius = 8
        photoImage.layer.masksToBounds = true
    }
    
    func configureCell(model: GameCellModel){
        titleLabel.text = model.name
        subtitleLabel.text = model.released
        ratingLabel.text = model.rating != nil ? "\(model.rating!)" : "-"
        photoImage.setImage(from: model.backgroundImage)
                
    }
}
