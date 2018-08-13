//
//  HeadInjuryViewController.swift
//  AppAid
//
//  Created by Mac on 2018-04-08.
//  Copyright © 2018 Layomi Dele-Dare. All rights reserved.
//

import UIKit
import Charts

class InjuryViewController: UIViewController {

    @IBOutlet weak var barView: BarChartView!;
    var months: [String]!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let numberInjuries = [2.0, 1.0 , 5.0, 3.0, 10.0, 2.0, 3.0, 4.0, 1.0, 5.0, 2.0, 1.0, 1.0]
        setChart(dataPoints: months, values: numberInjuries);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        let homePage = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = homePage
    }
    
    
    func setChart(dataPoints: [String], values: [Double]){
        var dataEntries: [BarChartDataEntry] = [];
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Number of injuries");
        let chartData = BarChartData(dataSet: chartDataSet);
        
        barView.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints);
        barView.xAxis.granularity = 1;
        barView.data = chartData;
        
        
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
