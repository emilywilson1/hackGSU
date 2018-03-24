//
//  LoginViewController.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation
import UIKit
//import AWSAuthCore
//import AWSAuthUI

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*if !AWSSignInManager.sharedInstance().isLoggedIn {
         AWSAuthUIViewController
         .presentViewController(with: self.navigationController!,
         configuration: nil,
         completionHandler: { (provider: AWSSignInProvider, error: Error?) in
         if error != nil {
         print("Error occurred: \(String(describing: error))")
         } else {
         // Sign in successful.
         }
         })
         }*/
    }
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login(_ sender: Any) {
        let employeeslist = Employees()
        print("employeeslist works")
        let employee = employeeslist.getEmployeeById(id: UInt(username.text!)!)
        print(employee.name)
        if (employee.password != password.text) {
            print("error signing in occurred")
        }
        else {
            if (employee.isManager) {
                //segue to manager portal
            } else {
                let employeeVC = storyboard?.instantiateViewController(withIdentifier: "employeeViewController") as! EmployeeViewController
                employeeVC.user = employee
                self.present(employeeVC, animated: true, completion: nil)
            }
        }
    }

    
}
