//
//  ForkliftInjuryViewController.swift
//  AppAid
//
//  Created by Mac on 2018-04-08.
//  Copyright © 2018 Layomi Dele-Dare. All rights reserved.
//

import UIKit
import Charts
import DropDown

class OverAllTypeViewController: UIViewController {
    
    @IBOutlet weak var chart: PieChartView!
    @IBOutlet weak var chooseYearButton: UIButton!
    
    let chooseYearDropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        if let year = chooseYearButton.titleLabel?.text{
            if let intYear = Int(year){
        
                let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
                myActivityIndicator.center = view.center
                
                myActivityIndicator.hidesWhenStopped = false
                
                myActivityIndicator.startAnimating()
                
                view.addSubview(myActivityIndicator)
                let myUrl = URL(string: "http://ec2-54-71-121-51.us-west-2.compute.amazonaws.com:8080/appaid-ws/api/stat/type?year=\(intYear)")
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
    
    @IBAction func yearSelectionButtonTapped(_ sender: Any) {
        chooseYearDropDown.show()
    }
    
    func removeActivityIndicator(activityIndicator: UIActivityIndicatorView){
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    func setChart(dataPoints: [String], values: [Double]){
        DispatchQueue.main.async {
            var dataEntries: [PieChartDataEntry] = []
            
            for i in 0..<dataPoints.count{
                let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i])
                dataEntries.append(dataEntry)
            }
            let chartDataSet = PieChartDataSet(values: dataEntries, label: nil)
            let chartData = PieChartData(dataSet: chartDataSet)
            
            let colors = [UIColor.blue, UIColor.red, UIColor.green]
            chartDataSet.colors = colors as! [NSUIColor]
            
            self.chart.data = chartData
        }
    }

    
    
}


