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
    @IBOutlet weak var timePeriod: UISegmentedControl!
    @IBOutlet weak var percentEngagement: PieChartView!
    
    @IBOutlet weak var percentFavorable: PieChartView!
    @IBOutlet weak var satisfactionCharts: UIView!
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
    }
}

