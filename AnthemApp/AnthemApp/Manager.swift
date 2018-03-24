//
//  Manager.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation
class Manager: Employee {
    
    let employeesList: [Employee]
    
    init(name: String, id: UInt, password: String, employees: [UInt]) {
        let employeeslist = Employees()
        employeesList = employeeslist.getEmployeesByIds(employeeIds: employees)
        super.init(name: name, id: id, manager: id, password: password, isManager: true)
    }
}
 
