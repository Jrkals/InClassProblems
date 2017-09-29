//
//  Ingredient.swift
//  RecipeReader
//
//  Created by Justin on 9/26/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import Foundation

struct Ingredient {
    let quantity: String
    let name: String
    let type: String
    
    // Default constructor
    init(quantity: String, name: String, type: String){
        self.quantity = quantity
        self.name = name
        self.type = type
    }
    
    // our personal constructor
    init(dictionary: [String: String]){
        self.init(quantity: dictionary["quantity"]!, name: dictionary["name"]!, type: dictionary["type"]!)
    }
}
