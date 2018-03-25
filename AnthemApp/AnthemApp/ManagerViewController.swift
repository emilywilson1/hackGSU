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
    @IBOutlet weak var percentEngagement: PieChartView!
    
    @IBOutlet weak var percentFavorable: PieChartView!
    @IBOutlet weak var satisfactionCharts: BarChartView!
    @IBOutlet weak var commentsBox: UIScrollView!
    
    @IBOutlet weak var greetingLabel: UILabel!
    var user: Manager?
    
    required init?(coder aDecoder: NSCoder) {
        user = nil
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        greetingLabel.text = "Hello, \(user!.employeeName)!"
    }
    
    @IBAction func logout() {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
        self.present(loginVC, animated: true, completion: nil)
    }
    
    func setupEngagementChart() {
        let numEngaged = Double(user!.responseStore.size) / Double(user!.employees)
        let numFavorable = Double(user!.responseStore.favorableResponses) / Double(user!.responseStore.size)
        let engaged = PieChartDataEntry(value: numEngaged, label: "Engaged Employees")
        let notEngaged = PieChartDataEntry(value: 1 - numEngaged, label: "Unengaged Employees")
        var dataSet = PieChartDataSet(values: [engaged, notEngaged], label: "Percent Engagement")
        percentEngagement.data? = PieChartData(dataSet: dataSet)
        let favorable = PieChartDataEntry(value: numFavorable, label: "Favorable Responses")
        let unfavorable = PieChartDataEntry(value: 1 - numFavorable, label: "Favorable Responses")
        dataSet = PieChartDataSet(values: [favorable, unfavorable], label: "Percent Favorable")
        percentFavorable.data? = PieChartData(dataSet: dataSet)
        var emoji0 = 0;
        var emoji1 = 0;
        var emoji2 = 0;
        var emoji3 = 0;
        var emoji4 = 0;
        for response in user!.responseStore.toArray() {
            if (response == 0) {
                emoji0 += 1
            } else if (response == 1) {
                emoji1 += 1
            } else if (response == 2) {
                emoji2 += 1
            } else if (response == 3) {
                emoji3 += 1
            } else {
                emoji4 += 1
            }
        }
        let entry0 = ChartDataEntry(x: 0, y: Double(emoji0))
        let entry1 = ChartDataEntry(x: 0, y: Double(emoji1))
        let entry2 = ChartDataEntry(x: 0, y: Double(emoji2))
        let entry3 = ChartDataEntry(x: 0, y: Double(emoji3))
        let entry4 = ChartDataEntry(x: 0, y: Double(emoji4))
        let barDataSet = BarChartDataSet(values: [entry0, entry1, entry2, entry3, entry4], label: "Satisfaction Levels by Emoji")
        satisfactionCharts.data = BarChartData(dataSet: barDataSet)
        
        for comment in user!.responseStore.commentQueue.backingArray {
            let label = UILabel()
            label.text = comment
            commentsBox.addSubview(label)
        }
    }
}

