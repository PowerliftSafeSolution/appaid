//
//  IncidentReportResult.swift
//  AppAid
//
//  Created by wenhao on 2018-07-19.
//  Copyright © 2018 Layomi Dele-Dare. All rights reserved.
//

import Foundation

class IncidentReportResult{
    
    var typeOfIncident: String?
    var employeeFirstName: String?
    var employeeLastName: String?
    var employeeId: Int?
    var jobTitle: String?
    var supervisorName: String?
    var isIncidentReported: Bool?
    var date: String?
    var time: String?
    var witnesses: [String]? = []
    var locationGeneral: String?
    var locationDetailedDescription: String?
    var leadUpToInjury: String?
    var possiblePrevention: String?
    var detailedDescriptionOfInjury: String?
    var injuryAbdomenLowerbackLumbarPelvis: Bool?
    var injuryHead: Bool?
    var injuryAnkleFoot: Bool?
    var injuryChest: Bool?
    var injuryHipThigh: Bool?
    var injuryKneeLowerleg: Bool?
    var injuryNeck: Bool?
    var injuryShoulderUpperarm: Bool?
    var injuryWristHand: Bool?
    var forkliftInvolved: Bool?
    var forkliftOperatorFirstName: String?
    var forkliftOperatorLastName: String?
    var forkliftOperatorEmployeeId: String?
    var possibleInjury: String?
    var doctorVisit: Bool?
    var doctorPhoneNumber: String?
    var dateOfVisit: String?
    var timeOfVisit: String?
    var injuryLocationOnBodyMoreThanOnce: Bool?
    var dateOfPreviousInjury: String?
    var nameOfPreviousSupervisorForPreviousInjury: String?
    
    init(){
        
    }
    
}
