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
    @IBOutlet weak var previousInjuryDateTime: UITextField!
    
    @IBOutlet weak var witnesses: UITextView!
    @IBOutlet weak var ledUpToInjuryTextView: UITextView!
    
    
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
    let previousInjuryDateTimePicker = UIDatePicker()
    
    
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
        
        witnesses.layer.borderWidth = 1
        witnesses.layer.borderColor = UIColor.black.cgColor
        
        ledUpToInjuryTextView.layer.borderWidth = 1
        ledUpToInjuryTextView.layer.borderColor = UIColor.black.cgColor
    
        
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

}
