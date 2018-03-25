//
//  ManagerViewController.swift
//  AnthemApp
//
//  Created by Emily Wilson on 3/24/18.
//  Copyright © 2018 Emily Wilson. All rights reserved.
//

import Foundation
import UIKit
import Charts

class ManagerViewController: UIViewController {
    
    @IBOutlet weak var percentEngagement: UILabel!
    
    @IBOutlet weak var percentFavorable: UILabel!
    @IBOutlet weak var satisfactionCharts: BarChartView!
    @IBOutlet weak var commentsBox: UITableView!
    
    @IBOutlet weak var greetingLabel: UILabel!
    var user: Manager?
    
    required init?(coder aDecoder: NSCoder) {
        user = nil
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        greetingLabel.text = "Hello, \(user!.employeeName)!"
        setupEngagementChart()
    }
    
    @IBAction func logout() {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
        self.present(loginVC, animated: true, completion: nil)
    }
    
    func setupEngagementChart() {
        
        var emoji0 = 0;
        var emoji1 = 0;
        var emoji2 = 0;
        var emoji3 = 0;
        var emoji4 = 0;
        var favorable: Double = 0
        let total = user!.responseStore.toArray().count
        for response in user!.responseStore.toArray() {
            if (response == 0) {
                emoji0 += 1
            } else if (response == 1) {
                emoji1 += 1
            } else if (response == 2) {
                emoji2 += 1
                favorable += 1
            } else if (response == 3) {
                emoji3 += 1
                favorable += 1
            } else {
                emoji4 += 1
                favorable += 1
            }
        }
        var engaged = Double(total) / Double(user!.employees)
        favorable /= Double(total)
        if (favorable < 0.7) {
            percentFavorable.textColor = Colors.red
        } else {
            percentFavorable.textColor = Colors.green
        }
        if (engaged < 0.7) {
            percentEngagement.textColor = Colors.red
        } else {
            percentEngagement.textColor = Colors.green
        }
        percentFavorable.text = "\(Int(favorable * 100))%"
        percentEngagement.text = "\(Int(engaged * 100))%"
        let entry0 = BarChartDataEntry(x: 0, y: Double(emoji0))
        let entry1 = BarChartDataEntry(x: 1, y: Double(emoji1))
        let entry2 = BarChartDataEntry(x: 2, y: Double(emoji2))
        let entry3 = BarChartDataEntry(x: 3, y: Double(emoji3))
        let entry4 = BarChartDataEntry(x: 4, y: Double(emoji4))
        let barDataSet = BarChartDataSet(values: [entry0, entry1, entry2, entry3, entry4], label: "Satisfaction Levels by Emoji")
        satisfactionCharts.data = BarChartData(dataSet: barDataSet)
        
        for comment in user!.responseStore.comments {
            var row = UITableViewCell(frame: CGRect(x:0, y: 0, width: commentsBox.frame.width, height: 200))
            print(comment)
            commentsBox.addSubview(row)
            row.textLabel?.text = comment
        }
    }
}

