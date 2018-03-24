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
    var ratingQueue: Queue<UInt>
    var size: Int
    
    class Queue<T> {
        var backingArray: [T]
        var size: Int
        init() {
            backingArray = [T]()
            size = 0
        }
        
        func add(data: T) {
            backingArray[size] = data
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
    }
    
    func addComment(comment: String) {
        commentQueue.add(data: comment)
    }
    
    func addRating(rating: UInt) {
        ratingQueue.add(data: rating)
    }
}
