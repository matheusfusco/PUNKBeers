//
//  HomeViewModel.swift
//  PUNKBeers
//
//  Created by Matheus Pacheco Fusco on 11/07/2018.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit

final class HomeViewModel: NSObject {
    
    //MARK: - Lets and Vars
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
    
    private var noMoreBeers: Bool = false
    
    //MARK: - Model Methods
    public func fetchBeers(page: Int) {
        if !self.noMoreBeers {
            BeerManager.getBeersList(page: page, onComplete: { (beers) in
                if beers.count > 0 {
                    self.beers.append(contentsOf: beers)
                }
                else {
                    self.noMoreBeers = true
                }
            }) { (apiError) in
                self.error = apiError
            }
        }
    }
}
