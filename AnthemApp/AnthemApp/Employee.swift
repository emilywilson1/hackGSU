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
    var id: Int
    var manager: Employee?
    var streak: UInt
    var password: String
    var isManager: Bool
    var responseStore: ResponseStorage
    var anthemStore: ResponseStorage
    
    init(name: String, id: Int, manager: Employee?, password: String, isManager: Bool, anthemStore: ResponseStorage, responses: ResponseStorage?) {
        employeeName = name
        self.id = id
        self.password = password
        self.manager = manager
        if (!isManager) {
            (manager! as! Manager).addEmployee()
        }
        self.isManager = isManager
        if (responses == nil) {
            responseStore = ResponseStorage()
        } else {
            responseStore = responses!
        }
        streak = 0
        self.anthemStore = anthemStore
    }
    
    
    func incrStreak() {
        streak += 1;
    }
    
    func storeResponse() {
        
    }
    
    
}
