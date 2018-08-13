//
//  IncidentReportPageOne.swift
//  AppAid
//
//  Created by wenhao on 2018-07-18.
//  Copyright © 2018 Layomi Dele-Dare. All rights reserved.
//

import UIKit
import DropDown

class IncidentReportViewController: UIViewController{
    
    @IBOutlet weak var chooseIncidentButton: UIButton!
    @IBOutlet weak var chooseReportedButton: UIButton!
    @IBOutlet weak var chooseDoctorVisitButton: UIButton!
    @IBOutlet weak var chooseInjuredBeforeButton: UIButton!
    
    @IBOutlet weak var dateInjurySelection: UITextField!
    @IBOutlet weak var timeInjurySelection: UITextField!
    @IBOutlet weak var dateVisitSelection: UITextField!
    @IBOutlet weak var timeVisitSelection: UITextField!
    @IBOutlet weak var previousInjuryDateSelection: UITextField!
    
    @IBOutlet weak var employeeNameTextField: UITextField!
    @IBOutlet weak var employeeIdTextField: UITextField!
    @IBOutlet weak var jobTitleTextField: UITextField!
    @IBOutlet weak var supervisorNameTextField: UITextField!
    @IBOutlet weak var supervisorEmployeeIdTextField: UITextField!
    @IBOutlet weak var locationOfInjuryTextField: UITextField!
    @IBOutlet weak var actionAtTimeTextField: UITextField!
    @IBOutlet weak var preventionTextField: UITextField!
    @IBOutlet weak var forkliftOperatorNameTextField: UITextField!
    @IBOutlet weak var forkliftOperatorEmployeeIdTextField: UITextField!
    @IBOutlet weak var doctorNameTextField: UITextField!
    @IBOutlet weak var previousSupervisorNameTextField: UITextField!
    @IBOutlet weak var previousSupervisorEmployeeIdTextField: UITextField!
    
    @IBOutlet weak var abdomenInjury: UISegmentedControl!
    @IBOutlet weak var lowerBackInjury: UISegmentedControl!
    @IBOutlet weak var lumbarInjury: UISegmentedControl!
    @IBOutlet weak var pelvisInjury: UISegmentedControl!
    @IBOutlet weak var headInjury: UISegmentedControl!
    @IBOutlet weak var ankleInjury: UISegmentedControl!
    @IBOutlet weak var footInjury: UISegmentedControl!
    @IBOutlet weak var chestInjury: UISegmentedControl!
    @IBOutlet weak var hipInjury: UISegmentedControl!
    @IBOutlet weak var thightInjury: UISegmentedControl!
    @IBOutlet weak var kneeInjury: UISegmentedControl!
    @IBOutlet weak var lowerLegInjury: UISegmentedControl!
    @IBOutlet weak var neckInjury: UISegmentedControl!
    @IBOutlet weak var shoulderInjury: UISegmentedControl!
    @IBOutlet weak var upperArmInjury: UISegmentedControl!
    @IBOutlet weak var wristInjury: UISegmentedControl!
    @IBOutlet weak var handInjury: UISegmentedControl!
    @IBOutlet weak var forkliftInvolved: UISegmentedControl!
    
    
    @IBOutlet weak var witnessesTextView: UITextView!
    @IBOutlet weak var leadUpToInjuryTextView: UITextView!
    
    @IBOutlet weak var typeIncidentLabel: UILabel!
    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var employeeIdLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var supervisorNameLabel: UILabel!
    @IBOutlet weak var supervisorEmployeeIdLabel: UILabel!
    @IBOutlet weak var reportedLabel: UILabel!
    @IBOutlet weak var dateIncidentLabel: UILabel!
    @IBOutlet weak var timeIncidentLabel: UILabel!
    @IBOutlet weak var witnessLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var leadUpLabel: UILabel!
    @IBOutlet weak var preventionLabel: UILabel!
    @IBOutlet weak var forkliftOperatorNameLabel: UILabel!
    @IBOutlet weak var forkliftOperatorEmployeeIdLabel: UILabel!
    @IBOutlet weak var doctorVisitLabel: UILabel!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var dateVisitLabel: UILabel!
    @IBOutlet weak var timeVisitLabel: UILabel!
    @IBOutlet weak var injuredBeforeLabel: UILabel!
    @IBOutlet weak var injuredBeforeDateLabel: UILabel!
    @IBOutlet weak var previousSupervisorNameLabel: UILabel!
    @IBOutlet weak var previousSupervisorEmployeeIdLabel: UILabel!
    
    
    
    let typeIncidents = ["Injury","Illness", "Near miss"]
    let yesno = ["Yes", "No"]
    
    let chooseIncidentDropDown = DropDown()
    let chooseReported = DropDown()
    let chooseDoctorVisit = DropDown()
    let chooseInjuredBefore = DropDown()
    
    let injuryDatePicker = UIDatePicker()
    let injuryTimePicker = UIDatePicker()
    let visitDatePicker = UIDatePicker()
    let visitTimePicker = UIDatePicker()
    let previousInjuryDatePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        chooseIncidentButton.layer.borderWidth = 1
        chooseIncidentButton.layer.borderColor = UIColor.black.cgColor
        
        chooseReportedButton.layer.borderWidth = 1
        chooseReportedButton.layer.borderColor = UIColor.black.cgColor
        
        chooseDoctorVisitButton.layer.borderWidth = 1
        chooseDoctorVisitButton.layer.borderColor = UIColor.black.cgColor
        
        chooseInjuredBeforeButton.layer.borderWidth = 1
        chooseInjuredBeforeButton.layer.borderColor = UIColor.black.cgColor
        
        witnessesTextView.layer.borderWidth = 1
        witnessesTextView.layer.borderColor = UIColor.black.cgColor
        
        leadUpToInjuryTextView.layer.borderWidth = 1
        leadUpToInjuryTextView.layer.borderColor = UIColor.black.cgColor
    
        
        chooseIncidentDropDown.anchorView = chooseIncidentButton
        
        chooseIncidentDropDown.dataSource = typeIncidents
        chooseIncidentDropDown.selectionAction = {[weak self] (index, item) in self?.chooseIncidentButton.setTitle(item, for: .normal)}
        
        chooseIncidentDropDown.dismissMode = .onTap
        chooseIncidentDropDown.direction = .any
        
        chooseReported.anchorView = chooseReportedButton
        chooseReported.dataSource = yesno
        chooseReported.selectionAction = {[weak self] (index, item) in self?.chooseReportedButton.setTitle(item, for: .normal)}
        
        chooseReported.dismissMode = .onTap
        chooseReported.direction = .any
        
        chooseDoctorVisit.anchorView = chooseDoctorVisitButton
        chooseDoctorVisit.dataSource = yesno
        chooseDoctorVisit.selectionAction = {[weak self] (index, item) in self?.chooseDoctorVisitButton.setTitle(item, for: .normal)}
        
        chooseDoctorVisit.dismissMode = .onTap
        chooseDoctorVisit.direction = .any
        
        chooseInjuredBefore.anchorView = chooseInjuredBeforeButton
        chooseInjuredBefore.dataSource = yesno
        chooseInjuredBefore.selectionAction = {[weak self] (index, item) in self?.chooseInjuredBeforeButton.setTitle(item, for: .normal)}
        
        chooseInjuredBefore.dismissMode = .onTap
        chooseInjuredBefore.direction = .any
        
        createInjuryDatePicker()
        createInjuryTimePicker()
        
        createVisitDatePicker()
        createVisitTimePicker()
        
        createPreviousInjuryDatePicker()
        
        employeeIdTextField.keyboardType = .numberPad
        supervisorEmployeeIdTextField.keyboardType = .numberPad
        forkliftOperatorEmployeeIdTextField.keyboardType = .numberPad
        previousSupervisorEmployeeIdTextField.keyboardType = .numberPad
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseTypeIncident(_ sender: Any) {
        chooseIncidentDropDown.show()
    }
    
    @IBAction func chooseReported(_ sender: Any) {
        chooseReported.show()
    }
    
    @IBAction func chooseDoctorVisit(_ sender: Any) {
        chooseDoctorVisit.show()
    }
    @IBAction func chooseInjuredBefore(_ sender: Any) {
        chooseInjuredBefore.show()
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        var result: IncidentReportResult = IncidentReportResult()
        var noEmpty: Bool = true
        
        if let incidentType = chooseIncidentButton.titleLabel?.text{
            result.typeOfIncident = incidentType
            
            if incidentType == "Injury"{
                result.descriptionOfInjuryPossibleInjury = "Injury of the"
            }else if incidentType == "Near miss"{
                result.descriptionOfInjuryPossibleInjury = "Potential injury of the"
            }
        }else{
            noEmpty = false
            typeIncidentLabel.textColor = UIColor.red
            chooseIncidentButton.layer.borderColor = UIColor.red.cgColor
            chooseIncidentButton.layer.borderWidth = 1.0
        }
        
        if let doctorVisited = chooseDoctorVisitButton.titleLabel?.text{
            result.doctorVisit = doctorVisited
        }else{
            noEmpty = false
            doctorVisitLabel.textColor = UIColor.red
            chooseDoctorVisitButton.layer.borderColor = UIColor.red.cgColor
            chooseDoctorVisitButton.layer.borderWidth = 1.0
        }
        
        if let reported = chooseReportedButton.titleLabel?.text{
            result.isIncidentReported = reported
        }else{
            noEmpty = false
            reportedLabel.textColor = UIColor.red
            chooseReportedButton.layer.borderColor = UIColor.red.cgColor
            chooseReportedButton.layer.borderWidth = 1.0
        }
        
        if let injuredBefore  = chooseInjuredBeforeButton.titleLabel?.text{
            result.injuryLocationOnBodyMoreThanOnce = injuredBefore
        }else{
            noEmpty = false
            injuredBeforeLabel.textColor = UIColor.red
            chooseInjuredBeforeButton.layer.borderColor = UIColor.red.cgColor
            chooseInjuredBeforeButton.layer.borderWidth = 1.0
        }
        
        if let injuryDate = dateInjurySelection.text{
            if injuryDate.isEmpty{
                noEmpty = false
                dateIncidentLabel.textColor = UIColor.red
                dateInjurySelection.layer.borderColor = UIColor.red.cgColor
                dateInjurySelection.layer.borderWidth = 1.0
            }else{
                let dateFormmater = DateFormatter()
                dateFormmater.dateFormat = "YYYY-MM-dd"
                
                let input = DateFormatter()
                input.dateFormat = "MM,dd,yyyy"
                let inputDate = input.date(from: injuryDate)
                result.date = dateFormmater.string(from: inputDate!)

            }
        }
        
        if let injuryTime = timeInjurySelection.text{
            if injuryTime.isEmpty{
                noEmpty = false
                timeIncidentLabel.textColor = UIColor.red
                timeInjurySelection.layer.borderColor = UIColor.red.cgColor
                timeInjurySelection.layer.borderWidth = 1.0
            }else{
                let dateFormmater = DateFormatter()
                dateFormmater.dateFormat = "HH:mm:ss"
                
                let input = DateFormatter()
                input.dateFormat = "HH:mm:ss a"
                let inputTime = input.date(from: injuryTime)
                result.time = dateFormmater.string(from: inputTime!)
            }
        }
        
        if let visitDate = dateVisitSelection.text{
            if result.doctorVisit == "Yes" && visitDate.isEmpty{
                noEmpty = false
                dateVisitSelection.layer.borderColor = UIColor.red.cgColor
                dateVisitSelection.layer.borderWidth = 1.0
                dateVisitLabel.textColor = UIColor.red
            }else{
                result.dateOfVisit = visitDate
            }

        }
        
        if let visitTime = timeVisitSelection.text{
            if result.doctorVisit == "Yes" && visitTime.isEmpty{
                noEmpty = false
                timeVisitSelection.layer.borderColor = UIColor.red.cgColor
                timeVisitSelection.layer.borderWidth = 1.0
                timeVisitLabel.textColor = UIColor.red
            }else{
                result.timeOfVisit = visitTime
            }
            
        }

        if let previousDate = previousInjuryDateSelection.text{
            if result.injuryLocationOnBodyMoreThanOnce == "Yes" && previousDate.isEmpty{
                noEmpty = false
                previousInjuryDateSelection.layer.borderColor = UIColor.red.cgColor
                previousInjuryDateSelection.layer.borderWidth = 1.0
                injuredBeforeDateLabel.textColor = UIColor.red
            }else{
                result.dateOfPreviousInjury = previousDate
            }
        }
        
        if let employeeName = employeeNameTextField.text{
            if employeeName.isEmpty{
                noEmpty = false
                employeeNameLabel.textColor = UIColor.red
                employeeNameTextField.layer.borderColor = UIColor.red.cgColor
                employeeNameTextField.layer.borderWidth = 1.0
            }else{
                result.employeeName = employeeName
            }
        }
        
        if let employeeId = Int(employeeIdTextField.text!){
            result.employeeId = employeeId
        }else{
            noEmpty = false
            employeeIdLabel.textColor = UIColor.red
            employeeIdTextField.layer.borderColor = UIColor.red.cgColor
            employeeIdTextField.layer.borderWidth = 1.0
        }
 
        if let title = jobTitleTextField.text{
            if title.isEmpty{
                noEmpty = false
                jobTitleTextField.layer.borderColor = UIColor.red.cgColor
                jobTitleTextField.layer.borderWidth = 1.0
                jobTitleLabel.textColor = UIColor.red
            }else{
                result.jobTitle = title
            }
            
        }

        if let supervisorName = supervisorNameTextField.text{
            if supervisorName.isEmpty{
                noEmpty = false
                supervisorNameLabel.textColor = UIColor.red
                supervisorNameTextField.layer.borderColor = UIColor.red.cgColor
                supervisorNameTextField.layer.borderWidth = 1.0
            }else{
                result.supervisorName = supervisorName
            }
            
        }
        
        if let supervisorEmployeeId = Int(supervisorEmployeeIdTextField.text!){
            result.supervisorEmployeeId = supervisorEmployeeId
        }else{
            noEmpty = false
            supervisorEmployeeIdLabel.textColor = UIColor.red
            supervisorEmployeeIdTextField.layer.borderColor = UIColor.red.cgColor
            supervisorEmployeeIdTextField.layer.borderWidth = 1.0
        }

        if let locationInjury = locationOfInjuryTextField.text{
            if locationInjury.isEmpty{
                noEmpty = false
                locationOfInjuryTextField.layer.borderColor = UIColor.red.cgColor
                locationOfInjuryTextField.layer.borderWidth = 1.0
                locationLabel.textColor = UIColor.red
            }else{
                result.locationOfInjury = locationInjury
            }
            
        }

        if let actionAtTime = actionAtTimeTextField.text{
            if actionAtTime.isEmpty{
                noEmpty = false
                actionLabel.textColor = UIColor.red
                actionAtTimeTextField.layer.borderColor = UIColor.red.cgColor
                actionAtTimeTextField.layer.borderWidth = 1.0
            }else{
                result.actionAtTime = actionAtTime
            }

        }
        
        if let prevention = preventionTextField.text{
            if prevention.isEmpty{
                noEmpty = false
                preventionLabel.textColor = UIColor.red
                preventionTextField.layer.borderColor = UIColor.red.cgColor
                preventionTextField.layer.borderWidth = 1.0
            }
            result.possiblePrevention = prevention
        }
        
        if forkliftInvolved.selectedSegmentIndex == 1{
            result.forkliftInvolved = true
        }
        
        if let forkliftOperatorName = forkliftOperatorNameTextField.text{
            if result.forkliftInvolved && forkliftOperatorName.isEmpty{
                noEmpty = false
                forkliftOperatorNameTextField.layer.borderColor = UIColor.red.cgColor
                forkliftOperatorNameTextField.layer.borderWidth = 1.0
                forkliftOperatorNameLabel.textColor = UIColor.red
            }else{
                result.forkliftOperatorName = forkliftOperatorName
            }
        }

        if let forkliftOperatorEmployeeId = Int(forkliftOperatorEmployeeIdTextField.text!){
            result.forkliftOperatorEmployeeId = forkliftOperatorEmployeeId
        }else{
            if result.forkliftInvolved{
                noEmpty = false
                forkliftOperatorEmployeeIdLabel.textColor = UIColor.red
                forkliftOperatorEmployeeIdTextField.layer.borderColor = UIColor.red.cgColor
                forkliftOperatorEmployeeIdTextField.layer.borderWidth = 1.0
            }
        }

        if let doctorName = doctorNameTextField.text{
            if result.doctorVisit == "Yes" && doctorName.isEmpty{
                noEmpty = false
                doctorNameTextField.layer.borderWidth = 1.0
                doctorNameTextField.layer.borderColor = UIColor.red.cgColor
                doctorNameLabel.textColor = UIColor.red
            }else{
                 result.doctorName = doctorName
            }
        }
        
        if let previousSupervisorName = previousSupervisorNameTextField.text{
            if result.injuryLocationOnBodyMoreThanOnce == "Yes" && previousSupervisorName.isEmpty{
                noEmpty = false
                previousSupervisorNameLabel.textColor = UIColor.red
                previousSupervisorNameTextField.layer.borderColor = UIColor.red.cgColor
                previousSupervisorNameTextField.layer.borderWidth = 1.0
            }else{
                result.perviousSupervisorName = previousSupervisorName
            }
            
        }
  
        if let previousSupervisorEmployeeId = Int(previousSupervisorEmployeeIdTextField.text!){
            result.previousSupervisorEmployeeId = previousSupervisorEmployeeId
        }else{
            if result.injuryLocationOnBodyMoreThanOnce == "Yes"{
                noEmpty = false
                previousSupervisorEmployeeIdLabel.textColor = UIColor.red
                previousSupervisorEmployeeIdTextField.layer.borderColor = UIColor.red.cgColor
                previousSupervisorEmployeeIdTextField.layer.borderWidth = 1.0
            }
        }

        if abdomenInjury.selectedSegmentIndex == 1{
            result.injuryAbdomen = true
            result.descriptionOfInjuryPossibleInjury += " abdomen,"
        }
        
        if lowerBackInjury.selectedSegmentIndex == 1{
            result.injuryLowerback = true
            result.descriptionOfInjuryPossibleInjury += " lower back,"
        }
        
        if lumbarInjury.selectedSegmentIndex == 1{
            result.injuryLumbar = true
            result.descriptionOfInjuryPossibleInjury += " lumbar,"
        }
        
        if pelvisInjury.selectedSegmentIndex == 1{
            result.injuryPelvis = true
            result.descriptionOfInjuryPossibleInjury += " pelvis,"
        }
        
        if headInjury.selectedSegmentIndex == 1{
            result.injuryHead = true
            result.descriptionOfInjuryPossibleInjury += " head,"
        }

        if ankleInjury.selectedSegmentIndex == 1{
            result.injuryAnkle = true
            result.descriptionOfInjuryPossibleInjury += " ankle,"
        }
        
        if footInjury.selectedSegmentIndex == 1{
            result.injuryFoot = true
            result.descriptionOfInjuryPossibleInjury += " foot,"
        }
        
        if hipInjury.selectedSegmentIndex == 1{
            result.injuryHip = true
            result.descriptionOfInjuryPossibleInjury += " hip,"
        }
        
        if pelvisInjury.selectedSegmentIndex == 1{
            result.injuryPelvis = true
            result.descriptionOfInjuryPossibleInjury += " pelvis,"
        }
        
        if thightInjury.selectedSegmentIndex == 1{
            result.injuryThigh = true
            result.descriptionOfInjuryPossibleInjury += " thigh,"
        }
        
        if kneeInjury.selectedSegmentIndex == 1{
            result.injuryKnee = true
            result.descriptionOfInjuryPossibleInjury += " knee,"
        }
        
        if lowerLegInjury.selectedSegmentIndex == 1{
            result.injuryLowerleg = true
            result.descriptionOfInjuryPossibleInjury += " lower leg,"
        }
        
        if neckInjury.selectedSegmentIndex == 1{
            result.injuryNeck = true
            result.descriptionOfInjuryPossibleInjury += " neck,"
        }
        
        if shoulderInjury.selectedSegmentIndex == 1{
            result.injuryShoulder = true
            result.descriptionOfInjuryPossibleInjury += " shoulder,"
        }
        
        if upperArmInjury.selectedSegmentIndex == 1{
            result.injuryUpperarm = true
            result.descriptionOfInjuryPossibleInjury += " upper arm,"
        }
        
        if wristInjury.selectedSegmentIndex == 1{
            result.injuryWrist = true
            result.descriptionOfInjuryPossibleInjury += " wrist,"
        }
        
        if handInjury.selectedSegmentIndex == 1{
            result.injuryHand = true
            result.descriptionOfInjuryPossibleInjury += " hand,"
        }
        
        if let witness = witnessesTextView.text{
            if witness.isEmpty{
                witnessLabel.textColor = UIColor.red
                witnessesTextView.layer.borderColor = UIColor.red.cgColor
                witnessesTextView.layer.borderWidth = 1.0
            }else{
                result.witnesses = witness
            }
        }
        
        if let leadUp = leadUpToInjuryTextView.text{
            if leadUp.isEmpty{
                leadUpToInjuryTextView.layer.borderColor = UIColor.red.cgColor
                leadUpToInjuryTextView.layer.borderWidth = 1.0
                leadUpLabel.textColor = UIColor.red
            }else{
                result.leadUpToInjury = leadUp
            }
        }
        result.descriptionOfInjuryPossibleInjury = String(result.descriptionOfInjuryPossibleInjury.dropLast())
        
        if noEmpty{
            let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
            myActivityIndicator.center = view.center
            
            myActivityIndicator.hidesWhenStopped = false
            
            myActivityIndicator.startAnimating()
            
            view.addSubview(myActivityIndicator)
            
            let jsonEncoder = JSONEncoder()
            
            let jsonData = try? jsonEncoder.encode(result)
            
            let myUrl = URL(string: "http://ec2-54-71-121-51.us-west-2.compute.amazonaws.com:8080/appaid-ws/api/incidentreport")
            var request = URLRequest(url:myUrl!)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "content-type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { (data: Data?, response:URLResponse?, error: Error?) in
                
                if error != nil{
                    print("error=\(String(describing: error))")
                    return
                }
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                }catch{
                    self.removeActivityIndicator(activityIndicator: myActivityIndicator)
                    print(error)
                }
                
                
                self.removeActivityIndicator(activityIndicator: myActivityIndicator)
            }
            task.resume()
            self.dismiss(animated: true, completion: nil)
        }
        else{
           return
        }
        
    }
    
    func removeActivityIndicator(activityIndicator: UIActivityIndicatorView){
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let controller = storyboard.instantiateViewController(withIdentifier: "IncidentReportMainVC")
        //self.present(controller, animated: true, completion: nil)
    
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        let homePage = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = homePage
        
    }
    
    func createInjuryDatePicker(){
        injuryDatePicker.datePickerMode = .date
        
        dateInjurySelection.inputView = injuryDatePicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(injuryDateDoneClicked))
        
        toolbar.setItems([doneButton], animated: true)
        
        dateInjurySelection.inputAccessoryView = toolbar
    }
    
    @objc func injuryDateDoneClicked(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        dateInjurySelection.text = dateFormatter.string(from: injuryDatePicker.date)
        self.view.endEditing(true)
    }

    func createInjuryTimePicker(){
        injuryTimePicker.datePickerMode = .time
        
        timeInjurySelection.inputView = injuryTimePicker

        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(injuryTimeDoneClicked))
        
        toolbar.setItems([doneButton], animated: true)
        
        timeInjurySelection.inputAccessoryView = toolbar
    }
    
    @objc func injuryTimeDoneClicked(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        
        timeInjurySelection.text = dateFormatter.string(from: injuryTimePicker.date)
        self.view.endEditing(true)
    }
    
    func createVisitDatePicker(){
        visitDatePicker.datePickerMode = .date
        
        dateVisitSelection.inputView = visitDatePicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(visitDateDoneClicked))
        
        toolbar.setItems([doneButton], animated: true)
        
        dateVisitSelection.inputAccessoryView = toolbar
    }
    
    @objc func visitDateDoneClicked(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        dateVisitSelection.text = dateFormatter.string(from: visitDatePicker.date)
        self.view.endEditing(true)
    }
    
    func createVisitTimePicker(){
        visitTimePicker.datePickerMode = .time
        
        timeVisitSelection.inputView = visitTimePicker
        
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(visitTimeDoneClicked))
        
        toolbar.setItems([doneButton], animated: true)
        
        timeVisitSelection.inputAccessoryView = toolbar
    }
    
    @objc func visitTimeDoneClicked(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        
        timeVisitSelection.text = dateFormatter.string(from: visitTimePicker.date)
        self.view.endEditing(true)
    }
    
    func createPreviousInjuryDatePicker(){
        previousInjuryDatePicker.datePickerMode = .date
        
        previousInjuryDateSelection.inputView = previousInjuryDatePicker
        
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(previousInjuryDateDoneClicked))
        
        toolbar.setItems([doneButton], animated: true)
        
        previousInjuryDateSelection.inputAccessoryView = toolbar
    }
    
    @objc func previousInjuryDateDoneClicked(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        previousInjuryDateSelection.text = dateFormatter.string(from: previousInjuryDatePicker.date)
        self.view.endEditing(true)
    }

}
