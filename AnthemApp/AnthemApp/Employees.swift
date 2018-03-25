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
    
    /*init(employees: [Employee]) {
        if (employees.count == 0) {
            anthemStore = ResponseStorage()
            let array = [1, 2, 3]
            //UserDefaults.standard.set(array, forKey: "employees")
            var employee: Employee = Manager(name: "Monica", id: 2, password: "password", anthemStore: anthemStore, responses: nil)
            employeeList.updateValue(employee, forKey: 2)
            /*UserDefaults.standard.set(employee.responseStore.toArray(), forKey: "\(employee.id)-responses")
            UserDefaults.standard.set(employee.employeeName, forKey: "\(employee.id)-name")
            UserDefaults.standard.set(employee.id, forKey: "\(employee.id)-id")
            UserDefaults.standard.set(employee.password, forKey: "\(employee.id)-password")
            UserDefaults.standard.set(employee.manager, forKey: "\(employee.id)-manager")
            UserDefaults.standard.set(employee.isManager, forKey: "\(employee.id)-isManager")*/
            //print(UserDefaults.standard.object(forKey: "\(employee.id)-isManager"))
            employee = Employee(name: "Emily", id: 1, manager: employeeList[2]!, password: "password", isManager: false, anthemStore: anthemStore, responses: nil)
            employeeList.updateValue(employee, forKey: 1)
            /*UserDefaults.standard.set(employee.responseStore.toArray(), forKey: "\(employee.id)-responses")
            UserDefaults.standard.set(employee.employeeName, forKey: "\(employee.id)-name")
            UserDefaults.standard.set(employee.id, forKey: "\(employee.id)-id")
            UserDefaults.standard.set(employee.password, forKey: "\(employee.id)-password")
            UserDefaults.standard.set(employee.manager, forKey: "\(employee.id)-manager")
            UserDefaults.standard.set(employee.isManager, forKey: "\(employee.id)-isManager")*/
            employee = Employee(name: "Generic Employee Name", id: 3, manager: employeeList[2]!, password: "password", isManager: false, anthemStore: anthemStore, responses: nil)
            employeeList.updateValue(employee, forKey: 3)
            /*UserDefaults.standard.set(employee.responseStore.toArray(), forKey: "\(employee.id)-responses")
            UserDefaults.standard.set(employee.employeeName, forKey: "\(employee.id)-name")
            UserDefaults.standard.set(employee.id, forKey: "\(employee.id)-id")
            UserDefaults.standard.set(employee.password, forKey: "\(employee.id)-password")
            UserDefaults.standard.set(employee.manager, forKey: "\(employee.id)-manager")
            UserDefaults.standard.set(employee.isManager, forKey: "\(employee.id)-isManager")*/
        } else {
            var array = [Int]()
            for e in employees {
                employeeList.updateValue(e, forKey: e.id)
                array.append(Int(e.id))
                /*UserDefaults.standard.set(e.employeeName, forKey: "\(e.id)-name")
                UserDefaults.standard.set(e.id, forKey: "\(e.id)-id")
                UserDefaults.standard.set(e.password, forKey: "\(e.id)-password")
                UserDefaults.standard.set(e.manager, forKey: "\(e.id)-manager")
                UserDefaults.standard.set(e.isManager, forKey: "\(e.id)-isManager")*/
            }
            anthemStore = employees[0].anthemStore
            /*UserDefaults.standard.set(array, forKey: "employees")
            UserDefaults.standard.set(anthemStore.toArray(), forKey: "anthem-store")*/
        }
    }
    
    convenience init() {
        self.init(employees: [])
    }*/
    
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
