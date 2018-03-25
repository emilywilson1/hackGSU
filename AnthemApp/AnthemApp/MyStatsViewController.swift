//
//  MyStatsViewController.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation
import UIKit
import Charts

class MyStatsViewController: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var myRating: UILabel!
    @IBOutlet weak var teamRating: UILabel!
    @IBOutlet weak var anthemRating: UILabel!
    @IBOutlet weak var chart: BarChartView!
    @IBOutlet weak var logoutButton: UIButton!
    
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
        logoutButton.setTitleColor(Colors.darkBlue, for: .normal)
        let entry0 = BarChartDataEntry(x: 0, y: user!.responseStore.average_rating)
        let entry1 = BarChartDataEntry(x: 1, y: user!.manager!.responseStore.average_rating)
        let entry2 = BarChartDataEntry(x: 2, y: user!.anthemStore.average_rating)
        let barDataSet = BarChartDataSet(values: [entry0, entry1, entry2], label: "Satisfaction Levels by Emoji")
        chart.data = BarChartData(dataSet: barDataSet)
    }
    @IBAction func logout() {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
        self.present(loginVC, animated: true, completion: nil)
    }
}
