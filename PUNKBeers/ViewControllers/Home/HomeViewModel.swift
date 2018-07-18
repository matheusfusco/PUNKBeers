//
//  HomeViewModel.swift
//  PUNKBeers
//
//  Created by Matheus Pacheco Fusco on 11/07/2018.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit

final class HomeViewModel: NSObject {
    
    public typealias Closure = ([Beer]?, APIError?) -> ()
    
    public var fetch: Closure?
    
    public var beers: [Beer] = [] {
        didSet {
            DispatchQueue.main.async {
                self.fetch?(self.beers, nil)
            }
        }
    }
    
    public var error: APIError? {
        didSet {
            DispatchQueue.main.async {
                self.fetch?(nil, self.error)
            }
        }
    }
    
    public func fetchBeers(page: Int) {
        BeerManager.getBeersList(page: page, onComplete: { (beers) in
            self.beers.append(contentsOf: beers)
        }) { (apiError) in
            self.error = apiError
        }
    }
}
