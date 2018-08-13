//
//  HeadInjuryViewController.swift
//  AppAid
//
//  Created by Mac on 2018-04-08.
//  Copyright © 2018 Layomi Dele-Dare. All rights reserved.
//

import UIKit
import Charts
import DropDown

class InjuryViewController: UIViewController {

    @IBOutlet weak var barView: BarChartView!
    @IBOutlet weak var chooseInjuryTypeButton: UIButton!
    @IBOutlet weak var chooseYearButton: UIButton!
    
    let chooseYearDropDown = DropDown()
    let chooseInjuryTypeDropDown = DropDown()
    
    let chooseInjuryTypeDict:[String:String] = ["Abdomen Injury":"injury_abdomen","Lower Back Injury":"injury_lowerback",
                                                "Lumbar Injury":"injury_lumbar","Pelvis Injury":"injury_pelvis","Head Injury":"injury_head","Ankle Injury":"injury_ankle",
                                                "Foot Injury":"injury_foot","Chest Injury":"injury_chest","Hip Injury":"injury_hip","Thight Injury":"injury_thigh","Knee Injury":"injury_knee",
                                                "Lower Leg Injury":"injury_lower_leg","Shoulder Injury":"injury_shoulder",
                                                "Upper Arm Injury":"injury_upperarm","Wrist Injury":"injury_wrist","Hand Injury":"injury_hand","Neck Injury":"injury_neck"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseInjuryTypeButton.layer.borderWidth = 1
        chooseInjuryTypeButton.layer.borderColor = UIColor.black.cgColor
        chooseInjuryTypeDropDown.dataSource = Array(chooseInjuryTypeDict.keys)
        chooseInjuryTypeDropDown.selectionAction = {[weak self] (index, item) in self?.chooseInjuryTypeButton.setTitle(item, for: .normal)}
        chooseInjuryTypeDropDown.anchorView = self.chooseInjuryTypeButton
        
        
        chooseYearButton.layer.borderWidth = 1
        chooseYearButton.layer.borderColor = UIColor.black.cgColor
        
        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        myActivityIndicator.center = view.center
        
        myActivityIndicator.hidesWhenStopped = false
        
        myActivityIndicator.startAnimating()
        
        view.addSubview(myActivityIndicator)
        let myUrl = URL(string: "http://ec2-54-71-121-51.us-west-2.compute.amazonaws.com:8080/appaid-ws/api/stat/year")
        var request = URLRequest(url:myUrl!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response:URLResponse?, error: Error?) in
            
            if error != nil{
                print("error=\(String(describing: error))")
                return
            }
            
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                if let parseJSON = json {
                    if let years = parseJSON["years"] as? [Int]{
                        let stringarray = years.map{String($0)}
                        DispatchQueue.main.async {
                            self.chooseYearDropDown.dataSource = stringarray
                            self.chooseYearDropDown.selectionAction = {[weak self] (index, item) in self?.chooseYearButton.setTitle(item, for: .normal)}
                            self.chooseYearDropDown.anchorView = self.chooseYearButton
                        }
                    }else{
                        print("something went wrong")
                    }
                }
            }catch{
                self.removeActivityIndicator(activityIndicator: myActivityIndicator)
                print(error)
            }
            
            
            self.removeActivityIndicator(activityIndicator: myActivityIndicator)
        }
        task.resume()
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
    
    @IBAction func chooseInjuryTypeButtonTapped(_ sender: Any) {
        chooseInjuryTypeDropDown.show()
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
        if let year = chooseYearButton.titleLabel?.text{
            if let injuryType = chooseInjuryTypeButton.titleLabel?.text{
                if let intYear = Int(year){
                    
                    let injury = self.chooseInjuryTypeDict[injuryType]!
                    
                    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
                    myActivityIndicator.center = view.center
                    
                    myActivityIndicator.hidesWhenStopped = false
                    
                    myActivityIndicator.startAnimating()
                    
                    view.addSubview(myActivityIndicator)
                    let myUrl = URL(string: "http://ec2-54-71-121-51.us-west-2.compute.amazonaws.com:8080/appaid-ws/api/stat/injury?year=\(intYear)&type=\(injury)")
                    var request = URLRequest(url:myUrl!)
                    request.httpMethod = "GET"
                    request.addValue("application/json", forHTTPHeaderField: "Accept")
                    
                    let task = URLSession.shared.dataTask(with: request) { (data: Data?, response:URLResponse?, error: Error?) in
                        
                        if error != nil{
                            print("error=\(String(describing: error))")
                            return
                        }
                        
                        do{
                            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                            if let parseJSON = json {
                                if let values = parseJSON["values"] as? [Int]{
                                    let doubleValues = values.map{Double($0)}
                                    if let keys = parseJSON["keys"] as? [String]{
                                        self.setChart(dataPoints: keys, values: doubleValues)
                                    }
                                }
                            }
                        }catch{
                            self.removeActivityIndicator(activityIndicator: myActivityIndicator)
                            print(error)
                        }
                        
                        
                        self.removeActivityIndicator(activityIndicator: myActivityIndicator)
                    }
                    task.resume()
                }
            }
        }
        
    }
    
    @IBAction func chooseYearButtonTapped(_ sender: Any) {
        chooseYearDropDown.show()
    }
    
    
    
    func setChart(dataPoints: [String], values: [Double]){
        DispatchQueue.main.async {
            var dataEntries: [BarChartDataEntry] = [];
            
            for i in 0..<dataPoints.count {
                let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
                dataEntries.append(dataEntry)
            }
            
            let chartDataSet = BarChartDataSet(values: dataEntries, label: "Number of injuries");
            let chartData = BarChartData(dataSet: chartDataSet);
            
            self.barView.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints);
            self.barView.xAxis.granularity = 1;
            self.barView.data = chartData;
        }
        
    }

    func removeActivityIndicator(activityIndicator: UIActivityIndicatorView){
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }

}
