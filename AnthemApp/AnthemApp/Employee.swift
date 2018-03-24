//
//  Employee.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation
class Employee {
    
    var employeeName: String
    var id: UInt
    var managerID: UInt
    var streak: UInt
    var past365Days: [UInt]
    var password: String
    var isManager: Bool
    var responseStore: ResponseStorage
    
    init(name: String, id: UInt, manager: UInt, password: String, isManager: Bool) {
        employeeName = name
        self.id = id
        self.password = password
        managerID = manager
        self.isManager = isManager
        streak = 0
        past365Days = []
        responseStore = ResponseStorage()
    }
    
    func incrStreak() {
        streak += 1;
    }
    
    func storeResponse() {
        
    }
    
    
}
