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
    var responses: [Response]
    var size: Int
    var average_rating : Double
    var favorableResponses: Int
    
    init() {
        comments = [String]()
        responses = [Response]()
        size = 0;
        average_rating = 0
        favorableResponses = 0
    }
    
    convenience init(ratings: [Response]) {
        self.init()
        for rating in ratings {
            responses.append(rating)
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
        responses.append(Response(rating: rating, date: Date()))
        size += 1
    }
    
    func resetAverages() {
        average_rating = 0
    }
    
    func toArray() -> [Int] {
        var ratings = [Int]()
        for response in responses {
            ratings.append(response.rating)
        }
        return ratings
    }
    
    func getLastResponse() -> Response? {
        if (size == 0) {
            return nil
        }
        return responses[size - 1]
    }
}
