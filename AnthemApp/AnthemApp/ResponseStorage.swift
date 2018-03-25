//
//  ResponseStorage.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation

class ResponseStorage {
    var commentQueue: Queue<String>
    var ratingQueue: Queue<Int>
    var size: Int
    var average_rating : Float
    var favorableResponses: Int
    
    class Queue<T> {
        var backingArray: [T]
        var size: Int
        init() {
            backingArray = [T]()
            size = 0
        }
        
        func add(data: T) {
            backingArray.append(data)
            size += 1
        }
        
        func remove() {
            size -= 1
            backingArray.remove(at: size)
        }
    }
    
    init() {
        commentQueue = Queue()
        ratingQueue = Queue()
        size = 0;
        average_rating = 0
        favorableResponses = 0
    }
    
    convenience init(ratings: [Int]) {
        self.init()
        for rating in ratings {
            addRating(rating: rating)
        }
    }
    
    func addComment(comment: String) {
        commentQueue.add(data: comment)
    }
    
    func addRating(rating: Int) {
        average_rating = ((average_rating * Float(size)) + Float(rating)) / Float(size + 1)
        if (rating > 2) {
            favorableResponses += 1
        }
        ratingQueue.add(data: rating)
        size += 1
    }
    
    func resetAverages() {
        average_rating = 0
    }
    
    func toArray() -> [Int] {
        return ratingQueue.backingArray
    }
}
