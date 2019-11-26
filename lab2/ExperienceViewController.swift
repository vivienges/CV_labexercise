//
//  ExperienceViewController.swift
//  lab2
//
//  Created by Vivien Geschwind on 23.11.19.
//  Copyright © 2019 Vivien Geschwind. All rights reserved.
//

import UIKit


class ExperienceViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var typeOfExperience : [TypeOfExperience] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 100
        
        tableView.delegate = self
        tableView.dataSource = self
        
        typeOfExperience.append(TypeOfExperience.init(typeName: "Work", experiences: [Experience.init(institutionName: "Der Geniale Gemüsegarten", institutionLogo: "DGG_schwarz.png", durationOfExperience: "March 2018 - current", experienceDescription: "Der Geniale Gemüsegarten is a start-up that provides a plan for hobby gardeners how they can grow their own vegetables successfully at home even without garden. In their webshop they sell all the equipment you need e.g. growkits, soil, seeds, fertiliser and a whole book containing the plan. On their Youtube Channel they publish regularily videos with tips and instructions. My job at this company is to edit the videos for the Youtube channel e.g. adding the logo and subtitles."), Experience.init(institutionName: "Hochschule der Medien", institutionLogo: "hdm_schwarz.png", durationOfExperience: "April 2019 - July 2019", experienceDescription: "Hochschule der Medien is the university where I study. Last semester I worked there as a tutor in databases for first year students. My task was to help students during the lab sessions, evaluate their exercises and in the end to correct their exams (that one time I felt like a real teacher :D)"), Experience.init(institutionName: "Mercedes Benz", institutionLogo: "mercedes.png", durationOfExperience: "April 2018 - March 2019", experienceDescription: "Mercedes Benz is one of the biggest car manufacturers in Germany. I worked there during my studies and my holidays. I was involved in the car construction. My task was to install the rear window and the construction rail of the cars. This may sound as if you need mechanical experience to be able to do this. But honestly, no you don't! A lot of students work there during their studies because it is well-paid and you don't need experience for it ;-)")]))
        typeOfExperience.append(TypeOfExperience.init(typeName: "Education", experiences: [Experience.init(institutionName: "Jönköping University", institutionLogo: "jonkoping.png", durationOfExperience: "August 2019 - current", experienceDescription: "I am currently studying as an exchange student at Jönköping University. A semester abroad is not mandatory, but it always has been my dream to go to Sweden and study there. And why just staying for one semester, if you can do two? So yeah, I'm here for a whole year and so far I have the best time of my life! Here in Jönköping I'm reading the courses iOS Development, Motion Graphics, Client-Server Communication, Android Development, Business Planning and Entrepreneurship and a Swedish Language Course."), Experience.init(institutionName: "Hochschule der Medien", institutionLogo: "hdm_schwarz.png", durationOfExperience: "October 2017 - current", experienceDescription: "I am studying Digital Publishing at Hochschule der Medien in Stuttgart in my third year. The program takes in total three and a half years - a half year more because there's a mandatory internship included. My studies consist amongst others of Software and Web Development (Java and JavaScript), Databases, Project Management, Graphic Design and XML. Besides my studies I also took language courses in Spanish and Swedish, I was part of the International Committee of my university and I was in charge of the Social Media account of my program.")]))
        
    }
    var indexSection = 0
}


extension ExperienceViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.height, height: 50))
        
        view.backgroundColor = UIColor(red: 55/255.0, green: 192/255.0, blue: 170/255.0, alpha: 1)
        
        let sectionName = UILabel(frame: CGRect(x: 20, y:0, width: view.frame.width - 20, height: 50))
        sectionName.text = typeOfExperience[section].typeName
        
        view.addSubview(sectionName)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.typeOfExperience.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeOfExperience[section].experiences.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as? ExperienceTableViewCell {
            
            
            let types = typeOfExperience[indexPath.section]
            let experience = types.experiences[indexPath.row]
            cell.institutionImageView.image = UIImage(named: experience.institutionLogo)
            cell.institutionLabel.text = experience.institutionName
            cell.durationLabel.text = experience.durationOfExperience
            
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor(red: 242/255.0, green: 219/255.0, blue: 91/255.0, alpha: 1)
            cell.selectedBackgroundView = bgColorView
            
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        indexSection = indexPath.section
        
        
        
        performSegue(withIdentifier: "experienceDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ExperienceDetailViewController {
            destination.currentExperience = typeOfExperience[indexSection].experiences[(tableView.indexPathForSelectedRow?.row)!]
            
            tableView.deselectRow(at: tableView!.indexPathForSelectedRow!, animated: true)
            
            
        }
        
        
    }
    
}
