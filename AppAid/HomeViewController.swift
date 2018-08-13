//
//  HomeViewController.swift
//  AppAid
//
//  Created by wenhao on 2018-08-11.
//  Copyright © 2018 Layomi Dele-Dare. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOutButtonTapped(_ sender: Any) {
        
        let loginPage = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = loginPage    }
    
    @IBAction func incidentReportButtonTapped(_ sender: Any) {
        
        let incidentPage = self.storyboard?.instantiateViewController(withIdentifier: "IncidentReportMainVC") as! IncidentReportMainViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = incidentPage
    }
    
    @IBAction func forkliftTrainingButtonTapped(_ sender: Any) {
        
        let trainingPage = self.storyboard?.instantiateViewController(withIdentifier: "ForkliftTrainingVC") as! ForkliftTrainingViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = trainingPage
        
    }
    
    @IBAction func incidentStatisticsButtonTapped(_ sender: Any) {
        
        let statPage = self.storyboard?.instantiateViewController(withIdentifier: "IncidentStatisticsVC") as! IncidentStatisticViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = statPage
    }
    
    
}
