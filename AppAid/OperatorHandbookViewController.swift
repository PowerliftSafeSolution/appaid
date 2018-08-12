//
//  OperatorHandbookViewController.swift
//  AppAid
//
//  Created by Layomi Dele-Dare on 7/13/18.
//  Copyright © 2018 Layomi Dele-Dare. All rights reserved.
//

import UIKit
import WebKit

class OperatorHandbookViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let path = Bundle.main.path(forResource: "Aguidetoforkliftoperatortraining", ofType: "pdf")
        let url = URL(fileURLWithPath: path!)
        let request = URLRequest(url: url)

        
        webView.load(request)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
