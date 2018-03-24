//
//  Employees.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation

class Employees {
    
    var employeeList = Dictionary<UInt, Employee>()
    
    init() {
        var employee: Employee = Manager(name: "Monica", id: 2, password: "password")
        employeeList.updateValue(employee, forKey: 2)
        employee = Employee(name: "Emily", id: 1, manager: employeeList[2]!, password: "password", isManager: false)
        employeeList.updateValue(employee, forKey: 1)
        employee = Employee(name: "Generic Employee Name", id: 3, manager: employeeList[2]!, password: "password", isManager: false)
        employeeList.updateValue(employee, forKey: 3)
    }
    
    func add(e: Employee) {
        employeeList[e.id] = e;
    }
    
    func getEmployeesByIds(employeeIds: [UInt]) -> [Employee] {
        var employees = [Employee]()
        for id in employeeIds {
            if (getEmployeeById(id: id) != nil) {
                employees.append(getEmployeeById(id: id)!);
            }
        }
        return employees
    }
    
    func getEmployeeById(id: UInt) -> Employee? {
        if (employeeList.count != 0) {
            return employeeList[id]
        }
        return nil
    }
}
