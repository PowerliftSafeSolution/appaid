//
//  SelectUploadViewController.swift
//  AppAid
//
//  Created by wenhao on 2018-08-10.
//  Copyright © 2018 Layomi Dele-Dare. All rights reserved.
//

import UIKit
import FileBrowser

class SelectUploadViewController: UIViewController {

    @IBOutlet weak var selectedFile: UITextField!
    @IBOutlet weak var givenName: UITextField!
    
    var fileToUpload: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectFileButton(_ sender: Any) {
        let fileBrowser = FileBrowser()
        fileBrowser.didSelectFile = { (file: FBFile) -> Void in
            self.selectedFile.text = file.displayName
            self.fileToUpload = file.filePath
        }
        self.present(fileBrowser, animated: true, completion: nil)
        	
    }
    
    @IBAction func uploadFileButton(_ sender: Any) {
        
        let localFile = selectedFile.text!
        
        if localFile.isEmpty{
            let alert = UIAlertController(title: "No file selected.", message: "Please select a file and try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler:nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
        
        myActivityIndicator.center = view.center
        
        myActivityIndicator.hidesWhenStopped = false
        
        myActivityIndicator.startAnimating()
        
        view.addSubview(myActivityIndicator)
        
        let serverUrl = URL(string: "ec2-54-71-121-51.us-west-2.compute.amazonaws.com:8080/appaid-ws/api/safety")
        
        var request = URLRequest(url: serverUrl!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
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
