//
//  Meal.swift
//  FoodTracker
//
//  Created by Jeff Huang on 2015-08-03.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//
import UIKit
import Foundation

class Meal {
    
    // MARK: Properties
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}

