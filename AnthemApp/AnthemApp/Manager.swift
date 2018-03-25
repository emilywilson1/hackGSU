//
//  Manager.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation
class Manager: Employee {
    
    var employees: Int
    
    init(name: String, id: Int, password: String, anthemStore: ResponseStorage, responses: ResponseStorage?) {
        employees = 0
        super.init(name: name, id: id, manager: nil, password: password, isManager:true, anthemStore: anthemStore, responses: responses)
    }
    
    func addEmployee() {
        employees += 1;
    }
}
 
