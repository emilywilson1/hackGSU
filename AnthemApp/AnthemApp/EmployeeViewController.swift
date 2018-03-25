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
    var user: Employee?
    @IBOutlet weak var employeeWell: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.text = "Hello, \(user!.employeeName)!"
        employeeWell.layer.cornerRadius = 8.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        user = nil
        super.init(coder: aDecoder)
    }
    
    @IBAction func emoji0Pressed() {
        emojiButtonPressed(emojiNum: 0)
    }
    @IBAction func emoji1Pressed() {
        emojiButtonPressed(emojiNum: 1)
    }
    @IBAction func emoji2Pressed() {
        emojiButtonPressed(emojiNum: 2)
    }
    @IBAction func emoji3Pressed() {
        emojiButtonPressed(emojiNum: 3)
    }
    @IBAction func emoji4Pressed() {
        emojiButtonPressed(emojiNum: 4)
    }
    
    func emojiButtonPressed(emojiNum: Int) {
        let streakVC = storyboard?.instantiateViewController(withIdentifier: "streakVC") as! StreakViewController
        streakVC.user = user!
        streakVC.response = emojiNum
        let lastResponse = user!.responseStore.getLastResponse()
        if (lastResponse == nil) {
            user!.incrStreak()
            user!.responseStore.addRating(rating: emojiNum + 1)
            user!.manager!.responseStore.addRating(rating: emojiNum + 1)
            user!.anthemStore.addRating(rating: emojiNum + 1)
        } else if (lastResponse!.responseAge() > 24) {
            user!.incrStreak()
            user!.responseStore.addRating(rating: emojiNum + 1)
            user!.manager!.responseStore.addRating(rating: emojiNum + 1)
            user!.anthemStore.addRating(rating: emojiNum + 1)
        }
        self.present(streakVC, animated: true, completion: nil)
    }
    
}
