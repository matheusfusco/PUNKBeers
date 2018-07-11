//
//  APIManager.swift
//  PUNKBeers
//
//  Created by Matheus Pacheco Fusco on 10/07/2018.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit

enum APIError {
    case url
    case taskError(error: NSError)
    case noResponse
    case noData
    case unknown
    case invalidJSON
}

class APIManager: NSObject {

    static var basePath = "https://api.punkapi.com/v2/beers"
    private static let configuration : URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = true
        config.httpAdditionalHeaders = ["Content-type" : "application/json"]
        config.timeoutIntervalForRequest = 40.0
        config.httpMaximumConnectionsPerHost = 4
        return config
    }()
    private static let sesssion = URLSession(configuration: configuration)
    
    static func GET(parameters: [String: String]?, onComplete: @escaping(Data) -> Void, onError: @escaping(APIError) -> Void) {
        guard let url = URL(string: basePath) else {
            onError(.url)
            return
        }
        
        var urlComp = URLComponents(string: url.absoluteString)
        
        if let params = parameters {
            var queryItems = [URLQueryItem]()
            for (key, value) in params {
                queryItems.append(URLQueryItem(name: key, value: value))
            }
            urlComp!.queryItems = queryItems
        }
        
        let urlRequest = URLRequest(url: urlComp!.url!)
        
        let dataTask = sesssion.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if error != nil {
                onError(.taskError(error: (error! as NSError)))
            }
            else {
                guard let response = urlResponse as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                switch response.statusCode {
                case 200:
                    guard let data = data else {
                        onError(.noData)
                        return
                    }
                    onComplete(data)
                    break
                default:
                    onError(.unknown)
                    break
                }
            }
        }
        dataTask.resume()
    }
}
