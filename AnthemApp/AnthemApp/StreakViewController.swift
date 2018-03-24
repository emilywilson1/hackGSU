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
    
    @IBOutlet weak var streakLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    @IBOutlet weak var suggestionBox: UITextField!
    
    var user: Employee?
    var response: UInt?
    var comment: String?
    
    required init?(coder aDecoder: NSCoder) {
        user = nil
        response = nil
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        streakLabel.text = "\(user!.streak) days!"
        if (response != nil && response! < 3) {
            greetingLabel.text = "We're sorry your experience wasn't satisfactory today!"
            suggestionLabel.text = "Is there anything we can do to make your experience at Anthem a little better?"
        } else {
            greetingLabel.text = "We're so glad that you're having a great experience at Anthem!"
            suggestionLabel.text = "Is there anything that made your experience with Anthem incredible today or is there anything we can do to improve your experience at Anthem?"
        }
    }
}
