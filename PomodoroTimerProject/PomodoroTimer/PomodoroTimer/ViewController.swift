//
//  ViewController.swift
//  PomodoroTimer
//
//  Created by 황지우 on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeCheckLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timeCheckLabel.text = "60 Mins"
        
    }
    
    @IBAction func resetButtonTabbed(_ sender: UIButton) {
        
        
    }
    
    @IBAction func startButtonTabbed(_ sender: UIButton) {
    }
}

