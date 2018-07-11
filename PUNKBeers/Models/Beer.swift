//
//  Beer.swift
//  PUNKBeers
//
//  Created by Matheus Pacheco Fusco on 04/07/2018.
//  Copyright © 2018 Fusco. All rights reserved.
//

import Foundation

struct Beer: Codable {
    var id: Int
    var name: String
    var tagline: String
    var first_brewed: String
    var description: String
    var image_url: String
    var abv: Float
    var ibu: Float
    var target_fg: Float
    var target_og: Float
    var ebc: Float
    var srm: Float
    var ph: Float
    var attenuation_level: Float
    var volume: ValueUnit
    var boil_volume: ValueUnit
    var method: Method
    var ingredients: Ingredients
    var food_pairing: [String]
    var brewers_tips: String
    var contributed_by: String
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        if let abv = try? container.decode(Int.self, forKey: .abv) {
//            self.abv = String(abv)
//        }
//        else {
//            self.abv =
//        }
//    }
}

struct ValueUnit: Codable {
    var value: Float
    var unit: String
}

struct Method: Codable {
    var mash_temp: [MashTemp]
    var fermentation: Fermentation
    var twist: String?
}

struct MashTemp: Codable {
    var temp: ValueUnit
    var duration: Float?
}

struct Fermentation: Codable {
    var temp: ValueUnit
}

struct Ingredients: Codable {
    var malt: [Malt]
    var hops: [Hops]
    var yeast: String
}

struct Malt: Codable {
    var name: String
    var amount: ValueUnit
}

struct Hops: Codable {
    var name: String
    var amount: ValueUnit
    var add: String
    var attribute: String
}

//MARK: - JSON Example
    /*
        {
            "id": 192,
            "name": "Punk IPA 2007 - 2010",
            "tagline": "Post Modern Classic. Spiky. Tropical. Hoppy.",
            "first_brewed": "04/2007",
            "description": "Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.",
            "image_url": "https://images.punkapi.com/v2/192.png",
            "abv": 6,
            "ibu": 60,
            "target_fg": 1010,
            "target_og": 1056,
            "ebc": 17,
            "srm": 8.5,
            "ph": 4.4,
            "attenuation_level": 82.14,
            "volume":
            {
                "value": 20,
                "unit": "liters"
            },
            "boil_volume":
            {
                "value": 25,
                "unit": "liters"
            },
            "method":
            {
                "mash_temp":
                [
                    {
                        "temp":
                        {
                            "value": 65,
                            "unit": "celsius"
                        },
                        "duration": 75
                    }
                ],
                "fermentation":
                {
                    "temp":
                    {
                        "value": 19,
                        "unit": "celsius"
                    }
                },
                "twist": null
            },
            "ingredients":
            {
                "malt":
                [
                    {
                        "name": "Extra Pale",
                        "amount": {
                            "value": 5.3,
                            "unit": "kilograms"
                        }
                    }
                ],
                "hops":
                [
                    {
                        "name": "Ahtanum",
                        "amount":
                        {
                            "value": 17.5,
                            "unit": "grams"
                        },
                        "add": "start",
                        "attribute": "bitter"
                    },
                    {
                    "name": "Chinook",
                    "amount":
                    {
                        "value": 15,
                        "unit": "grams"
                    },
                    "add": "start",
                    "attribute": "bitter"
                    }
                ],
                "yeast": "Wyeast 1056 - American Ale™"
            },
            "food_pairing":
            [
                "Spicy carne asada with a pico de gallo sauce",
                "Shredded chicken tacos with a mango chilli lime salsa",
                "Cheesecake with a passion fruit swirl sauce"
            ],
            "brewers_tips": "While it may surprise you, this version of Punk IPA isn't dry hopped but still packs a punch! To make the best of the aroma hops make sure they are fully submerged and add them just before knock out for an intense hop hit.",
            "contributed_by": "Sam Mason <samjbmason>"
        }
    */
