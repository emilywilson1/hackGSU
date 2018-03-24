//
//  Employees.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation

class Employees {
    
    var employeeList: [UInt: Employee] = [1: Employee(name: "Emily", id: 1, manager: 2, password: "password", isManager: false), 2: Manager(name: "Monica", id: 2, password: "password", employees: [1])]
    
    func add(e: Employee) {
        employeeList[e.id] = e;
    }
    
    func getEmployeesByIds(employeeIds: [UInt]) -> [Employee] {
        var employees = [Employee]()
        for id in employeeIds {
            employees.append(getEmployeeById(id: id));
        }
        return employees
    }
    
    func getEmployeeById(id: UInt) -> Employee {
        return employeeList[id]!
    }
}
