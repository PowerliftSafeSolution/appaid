//
//  IncidentStatisticViewController.swift
//  AppAid
//
//  Created by wenhao on 2018-08-12.
//  Copyright © 2018 Layomi Dele-Dare. All rights reserved.
//

import UIKit

class IncidentStatisticViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func incidenTypeButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "OverAllTypeVC")
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func nearMissButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "NearMissVC")
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func injuryButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "InjuryVC")
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func operatorNameButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ForkliftOperatorIdVC")
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func operatorIdButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ForkliftOperatorNameVC")
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func HomeButtonTapped(_ sender: Any) {
        let homePage = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = homePage
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
