//
//  Manager.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation
class Manager: Employee {
    
    var employeesList: [Employee]
    
    init(name: String, id: UInt, password: String, employees: [Employee]) {
        employeesList = employees
        super.init(name: name, id: id, manager: id, password: password, isManager: true)
    }
}
 
