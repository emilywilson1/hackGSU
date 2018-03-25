//
//  LogoutDetailController.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation
import UIKit

class LogoutDetailController: UIViewController {
    
    var user: Employee?
    
    @IBOutlet weak var logoutView: UIView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    
    override func viewDidLoad() {
        logoutView.layer.cornerRadius = 8.5
        logoutButton.setTitleColor(Colors.darkBlue, for: .normal)
        statsButton.setTitleColor(Colors.darkBlue, for: .normal)
    }
    required init?(coder aDecoder: NSCoder) {
        user = nil
        super.init(coder: aDecoder)
    }
    @IBAction func logout() {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
        self.present(loginVC, animated: true, completion: nil)
    }
    
    @IBAction func goToStats() {
        let statsVC = storyboard?.instantiateViewController(withIdentifier: "myStatsVC") as! MyStatsViewController
        statsVC.user = user!
        self.present(statsVC, animated: true, completion: nil)
    }
}
