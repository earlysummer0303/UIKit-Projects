//
//  ViewController.swift
//  PomodoroTimer
//
//  Created by 황지우 on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeCheckLabel: UILabel!
    
    @IBOutlet weak var timerView: TimerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timeCheckLabel.text = "60 Mins"
        timerView.colors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor]
        timerView.values = [0.25, 0.45, 0.10, 0.20]
        timerView.pieAnimate(duration: 10.0)
    }
    
    @IBAction func resetButtonTabbed(_ sender: UIButton) {
        
        
    }
    
    @IBAction func startButtonTabbed(_ sender: UIButton) {
    }
}

