//
//  StreakViewController.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation
import UIKit

class StreakViewController: UIViewController {
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var ratingsButton: UIButton!
    @IBOutlet weak var feedbackButton: UIButton!
    @IBOutlet weak var streakView: UIView!
    
    @IBOutlet weak var streakLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    @IBOutlet weak var suggestionBox: UITextField!
    
    var user: Employee?
    var response: Int?
    
    required init?(coder aDecoder: NSCoder) {
        user = nil
        response = nil
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        streakLabel.text = "\(user!.streak) days!"
        logoutButton.setTitleColor(Colors.darkBlue, for: .normal)
        ratingsButton.setTitleColor(Colors.darkBlue, for: .normal)
        feedbackButton.setTitleColor(Colors.darkBlue, for: .normal)
        streakView.layer.cornerRadius = 8.5
        if (response != nil && response! < 3) {
            greetingLabel.text = "We're sorry your experience wasn't satisfactory today!"
            suggestionLabel.text = "Is there anything we can do to make your experience at Anthem a little better?"
        } else {
            greetingLabel.text = "We're so glad that you're having a great experience at Anthem!"
            suggestionLabel.text = "Is there anything that made your experience with Anthem incredible today or is there anything we can do to improve your experience at Anthem?"
        }
    }
    @IBAction func viewMyStats() {
        let statsVC = storyboard?.instantiateViewController(withIdentifier: "myStatsVC") as! MyStatsViewController
        statsVC.user = user!
        self.present(statsVC, animated: true, completion: nil)
    }
    @IBAction func submitFeedback() {
        user!.manager!.responseStore.addComment(comment: suggestionBox.text!)
        let submittedVC = storyboard?.instantiateViewController(withIdentifier: "submittedFeedback") as! LogoutDetailController
        submittedVC.user = user!
        self.present(submittedVC, animated: true, completion: nil)
    }
    
    @IBAction func logout() {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
        self.present(loginVC, animated: true, completion: nil)
    }
}
