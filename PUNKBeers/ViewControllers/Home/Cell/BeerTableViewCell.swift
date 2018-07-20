//
//  BeerTableViewCell.swift
//  PUNKBeers
//
//  Created by Matheus Pacheco Fusco on 11/07/2018.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit
import Kingfisher

class BeerTableViewCell: UITableViewCell {
    
    public var beer: Beer? {
        didSet {
            beerImage.kf.setImage(with: URL(string: "\((beer?.image_url)!)"), placeholder: #imageLiteral(resourceName: "ic-placeholder-beer"))
            beerNameLabel.text = beer?.name
            alcoholContentLabel.text = String(format: "Teor alcóolico: %.2f", (beer?.abv)!)
        }
    }
    
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var alcoholContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
