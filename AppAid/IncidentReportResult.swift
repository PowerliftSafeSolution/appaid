//
//  IncidentReportResult.swift
//  AppAid
//
//  Created by wenhao on 2018-07-19.
//  Copyright © 2018 Layomi Dele-Dare. All rights reserved.
//

import Foundation

class IncidentReportResult: Codable{
    
    var typeOfIncident: String
    var employeeName: String
    var employeeId: Int
    var jobTitle: String
    var supervisorName: String
    var supervisorEmployeeId: Int
    var isIncidentReported: String
    var date: String
    var time: String
    var witnesses: String
    var locationOfInjury: String
    var leadUpToInjury: String
    var actionAtTime: String
    var possiblePrevention: String
    var descriptionOfInjuryPossibleInjury: String
    var injuryAbdomen: Bool
    var injuryLowerback: Bool
    var injuryLumbar: Bool
    var injuryPelvis: Bool
    var injuryHead: Bool
    var injuryAnkle: Bool
    var injuryFoot: Bool
    var injuryChest: Bool
    var injuryHip: Bool
    var injuryThigh: Bool
    var injuryKnee:Bool
    var injuryLowerleg: Bool
    var injuryNeck: Bool
    var injuryShoulder: Bool
    var injuryUpperarm: Bool
    var injuryWrist: Bool
    var injuryHand: Bool
    var forkliftInvolved: Bool
    var forkliftOperatorName: String
    var forkliftOperatorEmployeeId: Int
    var possibleInjury: String
    var doctorVisit: String
    var doctorName: String
    var doctorPhoneNumber: String
    var dateOfVisit: String
    var timeOfVisit: String
    var injuryLocationOnBodyMoreThanOnce: String
    var dateOfPreviousInjury: String
    var perviousSupervisorName: String
    var previousSupervisorEmployeeId: Int
    
    init(){
        typeOfIncident = ""
        employeeName = ""
        employeeId = 0
        jobTitle = ""
        supervisorName = ""
        supervisorEmployeeId = 0
        isIncidentReported = ""
        date = ""
        time = ""
        witnesses = ""
        locationOfInjury = ""
        leadUpToInjury = ""
        actionAtTime = ""
        possiblePrevention = ""
        descriptionOfInjuryPossibleInjury = ""
        injuryAbdomen = false
        injuryLowerback = false
        injuryLumbar = false
        injuryPelvis = false
        injuryHead = false
        injuryAnkle = false
        injuryFoot = false
        injuryChest = false
        injuryHip = false
        injuryThigh = false
        injuryKnee = false
        injuryLowerleg = false
        injuryNeck = false
        injuryShoulder = false
        injuryUpperarm = false
        injuryWrist = false
        injuryHand = false
        forkliftInvolved = false
        forkliftOperatorName = ""
        forkliftOperatorEmployeeId = 0
        possibleInjury = ""
        doctorVisit = ""
        doctorName = ""
        doctorPhoneNumber = ""
        dateOfVisit = ""
        timeOfVisit = ""
        injuryLocationOnBodyMoreThanOnce = ""
        dateOfPreviousInjury = ""
        perviousSupervisorName = ""
        previousSupervisorEmployeeId = 0
    }
    
}
