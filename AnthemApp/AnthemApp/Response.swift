//
//  Response.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/25/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation

class Response {
    
    var rating: Int
    var date: Date
    
    init(rating: Int, date: Date) {
        self.rating = rating
        self.date = date
    }
    
    func responseAge() -> Int {
        let today = Date()
        return Int(today.timeIntervalSince(date) / (24 * 3600))
    }
    
}
