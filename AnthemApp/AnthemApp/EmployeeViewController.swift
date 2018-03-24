//
//  EmployeeViewController.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation
import UIKit

class EmployeeViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    var user: Employee
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.text = "Hello, " + user.name + "!"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
