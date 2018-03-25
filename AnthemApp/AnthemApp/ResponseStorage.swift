//
//  ResponseStorage.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation

class ResponseStorage {
    var comments: [String]
    var ratings: [Int]
    var size: Int
    var average_rating : Double
    var favorableResponses: Int
    
    init() {
        comments = [String]()
        ratings = [Int]()
        size = 0;
        average_rating = 0
        favorableResponses = 0
    }
    
    convenience init(ratings: [Int]) {
        self.init()
        for rating in ratings {
            self.ratings.append(rating)
        }
    }
    
    func addComment(comment: String) {
        comments.append(comment)
    }
    
    func addRating(rating: Int) {
        average_rating = ((average_rating * Double(size)) + Double(rating)) / Double(size + 1)
        if (rating > 2) {
            favorableResponses += 1
        }
        ratings.append(rating)
        size += 1
    }
    
    func resetAverages() {
        average_rating = 0
    }
    
    func toArray() -> [Int] {
        return ratings
    }
}
