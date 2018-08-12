//
//  RegisterPageViewController.swift
//  AppAid
//
//  Created by Layomi Dele-Dare on 4/4/18.
//  Copyright © 2018 Layomi Dele-Dare. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userConfirmPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToLoginPage(_ sender: Any) {
        self.dismiss(animated:true, completion: nil)
    }
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userEmail = userEmailTextField.text!;
        let userPassword = userPasswordTextField.text!;
        let userConfirmPassword = userConfirmPasswordTextField.text!;
    
        //check for empty fields
        if(userEmail.isEmpty || userPassword.isEmpty || userConfirmPassword.isEmpty)
        {
            //Display alert message
            displayMyAlertMessage(userMessage: "All fields are required");
            
            return;
        }
        
        if(userPassword.characters.count < 6)
        {
            //Display an alert message
            displayMyAlertMessage(userMessage: "Passwords must have at least 6 characters");
            return;
        }
        
        //check if passwords match
        if(userPassword != userConfirmPassword)
        {
            //Display an alert message
            displayMyAlertMessage(userMessage: "Passwords do not match");
            return;
        }
        
        //check if passwords is less than 6 digits
        //Store data
        UserDefaults.standard.set(userEmail, forKey:userEmail);
        UserDefaults.standard.set(userPassword, forKey:userPassword);
            UserDefaults.standard.synchronize();
        //Display alert message with confirmation
        let myAlert = UIAlertController(title:"Alert", message: "Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default){ action in
            self.dismiss(animated: true, completion: nil);
        }
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion:nil);
    
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        // print("validate calendar: \(testStr)")
        //let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[gmail]+\\.[ca]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailAddressString);
    }
    
    func displayMyAlertMessage(userMessage:String)
    {
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated:true, completion:nil);
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
