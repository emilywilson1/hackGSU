//
//  ManagerViewController.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation
import UIKit

class ManagerViewController: UIViewController {
    @IBOutlet weak var timePeriod: UISegmentedControl!
    @IBOutlet weak var percentEngagement: UIView!
    
    @IBOutlet weak var percentFavorable: UIView!
    @IBOutlet weak var satisfactionCharts: UIView!
    @IBOutlet weak var commentsBox: UIScrollView!
    
    var user: Manager?
    
    required init?(coder aDecoder: NSCoder) {
        user = nil
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
    }
    
}

