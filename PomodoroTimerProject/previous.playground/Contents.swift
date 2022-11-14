import UIKit


//
//  ViewController.swift
//  PomodoroTimer
//
//  Created by 황지우 on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeCheckLabel: UILabel!
    
    @IBOutlet weak var circleView: CircleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.circleView.backgroundColor = .clear
        self.timeCheckLabel.text = "60 Mins"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetButtonTabbed(_ sender: UIButton) {
        self.circleView.isReset = true
        
    }
    
    @IBAction func startButtonTabbed(_ sender: UIButton) {
    }
}

class CircleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    var innerCircle = UIBezierPath()
    var isReset = false
    var isStart = false
    
    override func draw(_ rect: CGRect) {
        // 도형을 그리는 파트
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let outerCircle = UIBezierPath(arcCenter:center, radius: 116, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        self.innerCircle.move(to: center)
        self.innerCircle.addArc(withCenter: center, radius: 116, startAngle: 0, endAngle: 0.5*CGFloat.pi, clockwise: false)
       let pin = UIBezierPath(arcCenter:center, radius: 32.5, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        #colorLiteral(red: 0, green: 0.8585752845, blue: 0, alpha: 1).setFill()
        outerCircle.fill()
        #colorLiteral(red: 0.7568627451, green: 1, blue: 0.6, alpha: 1).setFill()
        innerCircle.fill()
        #colorLiteral(red: 0.1254901961, green: 0.137254902, blue: 0.1725490196, alpha: 1).setFill()
        pin.fill()
        
    }
    
}
