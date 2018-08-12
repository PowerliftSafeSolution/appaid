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
    }
    
}
