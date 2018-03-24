//
//  Manager.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation
class Manager: Employee {
    
    init(name: String, id: UInt, password: String) {
        super.init(name: name, id: id, manager: nil, password: password, isManager:true)
    }
}
 
