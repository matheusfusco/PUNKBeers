//
//  BeerTableViewCellViewModel.swift
//  PUNKBeers
//
//  Created by Matheus Pacheco Fusco on 17/07/2018.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit

class BeerTableViewCellViewModel: NSObject {
    private let beer: Beer
    
    init(_ beer: Beer) {
        self.beer = beer
    }
}
