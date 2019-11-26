//
//  TypeOfExperience.swift
//  lab2
//
//  Created by Vivien Geschwind on 23.11.19.
//  Copyright © 2019 Vivien Geschwind. All rights reserved.
//

import Foundation

class TypeOfExperience {
    
    let typeName: String
    let experiences: [Experience]
    
    init(typeName: String, experiences: [Experience]) {
        self.typeName = typeName
        self.experiences = experiences
    }
}
