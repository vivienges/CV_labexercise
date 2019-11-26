//
//  Experience.swift
//  lab2
//
//  Created by Vivien Geschwind on 23.11.19.
//  Copyright © 2019 Vivien Geschwind. All rights reserved.
//

import Foundation

class Experience {
    
    let institutionName: String
    let institutionLogo: String
    let durationOfExperience: String
    let experienceDescription: String
    
    init(institutionName: String, institutionLogo: String, durationOfExperience: String, experienceDescription: String) {
        
        self.institutionName = institutionName
        self.institutionLogo = institutionLogo
        self.durationOfExperience = durationOfExperience
        self.experienceDescription = experienceDescription
    }
}
