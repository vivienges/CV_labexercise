//
//  ExperienceDetailViewController.swift
//  lab2
//
//  Created by Vivien Geschwind on 23.11.19.
//  Copyright © 2019 Vivien Geschwind. All rights reserved.
//

import UIKit

class ExperienceDetailViewController: UIViewController {
    
    var currentExperience = Experience(institutionName: "", institutionLogo: "", durationOfExperience: "", experienceDescription: "")
    
    @IBOutlet weak var NavItem: UINavigationItem!
    @IBOutlet weak var DetailImageView: UIImageView!
    @IBOutlet weak var ExperienceLabel: UILabel!
    @IBOutlet weak var ExperienceDurationLabel: UILabel!
    @IBOutlet weak var ExperienceDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NavItem.title = currentExperience.institutionName
        DetailImageView.image = UIImage(named: currentExperience.institutionLogo)
        ExperienceLabel.text = currentExperience.institutionName
        ExperienceDurationLabel.text = currentExperience.durationOfExperience
        ExperienceDescription.text = currentExperience.experienceDescription
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
