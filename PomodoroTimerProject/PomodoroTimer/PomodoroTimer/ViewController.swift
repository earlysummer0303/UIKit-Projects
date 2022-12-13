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
      
        timerView.colors = [#colorLiteral(red: 0.1254901961, green: 0.137254902, blue: 0.1725490196, alpha: 1)]
        timerView.values = [1]
        timerView.pieAnimate(duration: 6.0) // 초단위
      
       
    }
    
    @IBAction func resetButtonTabbed(_ sender: UIButton) {
        self.viewDidLoad()
        
    }
    
    @IBAction func startButtonTabbed(_ sender: UIButton) {
    
    }
}

