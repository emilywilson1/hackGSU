//
//  LoginViewController.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBackground.layer.cornerRadius = 8.5
        loginBackground.backgroundColor = Colors.blue
        centerBackground.layer.cornerRadius = 8.5
        loginButton.layer.cornerRadius = 8.5
        loginButton.setTitleColor(Colors.darkBlue, for: .normal)
    }
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginBackground: UIView!
    @IBOutlet weak var centerBackground: UIView!
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login() {
        let employee = Employees.getEmployeeById(id: Int(username.text!)!)
        if (employee != nil) {
            print(employee?.employeeName)
            if (employee!.password != password.text) {
                print("error signing in occurred")
            }
            else {
                if (employee!.isManager) {
                    let managerVC = storyboard?.instantiateViewController(withIdentifier: "managerVC") as! ManagerViewController
                    managerVC.user = employee! as? Manager
                    self.present(managerVC, animated: true, completion: nil)
                } else {
                    let employeeVC = storyboard?.instantiateViewController(withIdentifier: "employeeViewController") as! EmployeeViewController
                    employeeVC.user = employee!
                    self.present(employeeVC, animated: true, completion: nil)
                }
            }
        }
    }

    
}
