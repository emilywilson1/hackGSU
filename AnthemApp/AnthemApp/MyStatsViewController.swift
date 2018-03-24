//
//  MyStatsViewController.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation
import UIKit

class MyStatsViewController: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var myRating: UILabel!
    @IBOutlet weak var teamRating: UILabel!
    @IBOutlet weak var anthemRating: UILabel!
    
    var user: Employee?
    
    required init?(coder aDecoder: NSCoder) {
        user = nil
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        anthemRating.text = "\(user!.anthemStore.average_rating)"
        myRating.text = "\(user!.responseStore.average_rating)"
        teamRating.text = "\(user!.manager!.responseStore.average_rating)"
        greetingLabel.text = "Hi \(user!.employeeName), here are your stats!"
    }
    @IBAction func logout() {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
        self.present(loginVC, animated: true, completion: nil)
    }
}
