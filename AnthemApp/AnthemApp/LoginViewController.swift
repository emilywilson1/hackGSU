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
    
    @IBAction func login() {
        let employeeslist = Employees()
        print(username.text)
        let employee = employeeslist.getEmployeeById(id: UInt(username.text!)!)
        if (employee != nil) {
            print(employee?.employeeName)
            if (employee!.password != password.text) {
                print("error signing in occurred")
            }
            else {
                if (employee!.isManager) {
                    let managerVC = storyboard?.instantiateViewController(withIdentifier: "managerVC") as! ManagerViewController
                    managerVC.user = employee! as! Manager
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
