//
//  BeerManager.swift
//  PUNKBeers
//
//  Created by Matheus Pacheco Fusco on 10/07/2018.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit

final class BeerManager: APIManager {

    private static func getBeers(params: [String: String]?, onComplete: @escaping Handler.Beers, onError: @escaping Handler.Error) {
        self.GET(parameters: params, onComplete: { (data) in
            do {
                let beers = try JSONDecoder().decode([Beer].self, from: data)
                onComplete(beers)
            }
            catch {
                onError(.invalidJSON)
            }
        }) { (apiError) in
            onError(apiError)
        }
    }
    
    static func getBeersList(page: Int, onComplete: @escaping Handler.Beers, onError: @escaping Handler.Error) {
        let params = ["per_page" : "20",
                          "page" : "\(page)"]
        
        self.getBeers(params: params, onComplete: { (beers) in
            onComplete(beers)
        }) { (apiError) in
            onError(apiError)
        }
    }
    
    static func getRandomBeer(onComplete: @escaping Handler.OneBeer, onError: @escaping Handler.Error) {
        self.basePath += "/random"
        
        self.getBeers(params: nil, onComplete: { (beers) in
            onComplete(beers[0])
        }) { (apiError) in
            onError(apiError)
        }
    }
    
    static func getSpecificBeer(beerID: Int, onComplete: @escaping Handler.OneBeer, onError: @escaping Handler.Error) {
        
        self.basePath += "/\(beerID)"
        
        self.getBeers(params: nil, onComplete: { (beers) in
            onComplete(beers[0])
        }) { (apiError) in
            onError(apiError)
        }
    }
}
