//
//  Employees.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation

class Employees {
    
    static var anthemStore =  ResponseStorage()
    static var managers = [Manager(name: "Monica", id: 2, password: "password", anthemStore: anthemStore, responses: nil)]
    static var employeeList = [1: Employee(name: "Emily", id: 1, manager: managers[0], password: "password", isManager: false, anthemStore: anthemStore, responses: ResponseStorage()), 2: managers[0], 3: Employee(name: "Generic Employee Name", id: 3, manager: managers[0], password: "password", isManager: false, anthemStore: anthemStore, responses: ResponseStorage())]
    
    func add(e: Employee) {
        Employees.employeeList.updateValue(e, forKey: e.id);
    }
    
    static func getEmployeesByIds(employeeIds: [Int]) -> [Employee] {
        var employees = [Employee]()
        for id in employeeIds {
            if (getEmployeeById(id: id) != nil) {
                employees.append(getEmployeeById(id: id)!);
            }
        }
        return employees
    }
    
    static func getEmployeeById(id: Int) -> Employee? {
        if (Employees.employeeList.count != 0) {
            return Employees.employeeList[id]
        }
        return nil
    }
    
    func toArray() -> [Employee] {
        var list = [Employee]()
        for value in Employees.employeeList.values {
            list.append(value)
        }
        return list
    }
}
