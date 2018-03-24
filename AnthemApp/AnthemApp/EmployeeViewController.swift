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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.text = "Hello, \(user!.employeeName)!"
    }
    
    required init?(coder aDecoder: NSCoder) {
        user = nil
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func emoji0Pressed(_ sender: Any) {
        emojiButtonPressed(emojiNum: 0)
    }
    @IBAction func emoji1Pressed(_ sender: Any) {
        emojiButtonPressed(emojiNum: 1)
    }
    @IBAction func emoji2Pressed(_ sender: Any) {
        emojiButtonPressed(emojiNum: 2)
    }
    @IBAction func emoji3Pressed(_ sender: Any) {
        emojiButtonPressed(emojiNum: 3)
    }
    @IBAction func emoji4Pressed(_ sender: Any) {
        emojiButtonPressed(emojiNum: 4)
    }
    
    func emojiButtonPressed(emojiNum: UInt) {
        let streakVC = storyboard?.instantiateViewController(withIdentifier: "streakVC") as! StreakViewController
        user!.incrStreak()
        streakVC.user = user!
        streakVC.response = emojiNum
        self.present(streakVC, animated: true, completion: nil)
    }
    
}
