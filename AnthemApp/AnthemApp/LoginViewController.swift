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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login() {
        /*var employees: Employees
        if (UserDefaults.standard.object(forKey: "employees") != nil) {
            let employeeNums = UserDefaults.standard.object(forKey: "employees") as! [Int]
            var employeeList = [Employee]()
            let d = UserDefaults.standard
            for e in employeeNums {
                print(d.object(forKey: "\(e)-isManager"))
                if (!(d.object(forKey: "\(e)-isManager") as! Bool)) {
                    employeeList.append(Employee(name: d.object(forKey: "\(e)-name") as! String, id: d.object(forKey: "\(e)-id") as! UInt, manager: d.object(forKey: "\(e)-manager") as! Employee, password: d.object(forKey: "\(e)-password") as! String, isManager: (d.object(forKey: "\(e)-isManager") != nil), anthemStore: ResponseStorage(ratings: d.object(forKey: "anthem-store") as! [Int]), responses: ResponseStorage(ratings: d.object(forKey: "\(e)-responses") as! [Int])))
                } else {
                    employeeList.append(Manager(name: d.object(forKey: "\(e)-name") as! String, id: d.object(forKey: "\(e)-id") as! UInt, password: d.object(forKey: "\(e)-password") as! String, anthemStore: ResponseStorage(ratings: d.object(forKey: "anthem-store") as! [Int]), responses: ResponseStorage(ratings: d.object(forKey: "\(e)-responses") as! [Int])))
                }
            }
            employees = Employees(employees: employeeList)
        } else {
        employees = Employees()
        }*/
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
