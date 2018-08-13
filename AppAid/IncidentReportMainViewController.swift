//
//  IncidentReportMainViewController.swift
//  AppAid
//
//  Created by wenhao on 2018-08-12.
//  Copyright © 2018 Layomi Dele-Dare. All rights reserved.
//

import UIKit

class IncidentReportMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        let homePage = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = homePage
    }
    
    @IBAction func reportAnIncidentButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "IncidentReportVC")
        self.present(controller, animated: true, completion: nil)    }
    
}
