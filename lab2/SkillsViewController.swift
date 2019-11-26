//
//  SkillsViewController.swift
//  lab2
//
//  Created by Vivien Geschwind on 24.11.19.
//  Copyright © 2019 Vivien Geschwind. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController {

    @IBAction func dismissButton(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBOutlet weak var progressBar: ProgressBar!
    
    var countFired: CGFloat = 0
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
        self.countFired += 1
        
        DispatchQueue.main.async {
          self.progressBar.progress = min(0.03 * self.countFired, 1)
          
          if self.progressBar.progress == 1 {
            timer.invalidate()
        }
      }
    }
  }
}

