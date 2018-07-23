//
//  BeerDetailViewController.swift
//  PUNKBeers
//
//  Created by Matheus Pacheco Fusco on 11/07/2018.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit

final class BeerDetailViewController: UIViewController {
    
    //MARK: - Lets and Vars
    let model: BeerDetailViewModel = BeerDetailViewModel()
    
    //MARK: - IBOutlets
    @IBOutlet weak var beerIbuLabel: UILabel!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerAbvLabel: UILabel!
    
    @IBOutlet weak var beerDescriptionLabel: UILabel!
    @IBOutlet weak var beerTaglineLabel: UILabel!
    @IBOutlet weak var beerImage: UIImageView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //TODO: Por algum motivo, caso eu coloque essa linha de código no ViewDidLoad(setupView), as constraints dão problema
        self.beerImage.kf.setImage(with: URL(string: "\(self.model.beer.image_url)")!, placeholder: #imageLiteral(resourceName: "ic-placeholder-beer"))
    }
    
    //MARK: - Custom Methods
    private func setupView() {
        self.beerNameLabel.text = self.model.beer.name
        self.beerTaglineLabel.text = self.model.beer.tagline
        self.beerDescriptionLabel.text = self.model.beer.description
        self.beerAbvLabel.text = String(format: "%.2f", self.model.beer.abv)
        self.beerIbuLabel.text = self.model.beer.ibu != nil ? String(format: "%.2f", (self.model.beer.ibu)!) : "-"
        self.beerImage.kf.setImage(with: nil, placeholder: #imageLiteral(resourceName: "ic-placeholder-beer"))
    }

    //MARK: - Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
