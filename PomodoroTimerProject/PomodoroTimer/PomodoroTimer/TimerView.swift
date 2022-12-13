//
//  TimerView.swift
//  PomodoroTimer
//
//  Created by 황지우 on 2022/12/09.
//

import UIKit

class TimerView: UIView {
    
    private let pieBezierPath = UIBezierPath()
    
    private let maskLayer = CAShapeLayer()
    private let maskBezierPath = UIBezierPath()
    
    var colors: [CGColor]? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var values: [CGFloat]? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        definePieChatLayer()
    }
    
    
    func definePieChatLayer() {
        // 주어진 각도 값으로 파이차트를 그리는 부분
        guard let values = values else { return }
        guard let colors = colors else { return }
        
        let center = CGPoint(x: bounds.midX - 11.25, y: bounds.midY)
        
        var sAngle: CGFloat = 0
        var eAngle: CGFloat = 0
    
        for i in 0..<values.count {
            sAngle = eAngle
            eAngle = sAngle + values[i]
            
            pieBezierPath.removeAllPoints()
            pieBezierPath.move(to: center)
            pieBezierPath.addArc(withCenter: center, radius: 50, startAngle: sAngle * 2 * CGFloat.pi, endAngle: eAngle * 2 * CGFloat.pi, clockwise: true)
            pieBezierPath.close()
            
             let pieLayer = CAShapeLayer()
             pieLayer.path = pieBezierPath.cgPath
             pieLayer.fillColor = colors[i]
             pieLayer.strokeColor = #colorLiteral(red: 0.1254901961, green: 0.137254902, blue: 0.1725490196, alpha: 1)
             
             layer.addSublayer(pieLayer)
             }
       
             maskBezierPath.removeAllPoints()
             maskBezierPath.addArc(withCenter: center, radius: 50, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
             maskLayer.path = maskBezierPath.cgPath
             maskLayer.lineWidth = 200
             maskLayer.strokeEnd = 0
             maskLayer.fillColor = UIColor.red.cgColor
             maskLayer.strokeColor = UIColor.blue.cgColor
             
             layer.mask = maskLayer
          
        }
        
        func pieAnimate(duration: CFTimeInterval) {
            maskLayer.strokeEnd = 0
            maskLayer.removeAnimation(forKey: "maskAnimation")
            
            let pieAnimation = CABasicAnimation()
            pieAnimation.keyPath = "strokeEnd"
            pieAnimation.duration = duration
            pieAnimation.toValue = 1
            pieAnimation.fillMode = .forwards
            pieAnimation.isRemovedOnCompletion = false
            maskLayer.add(pieAnimation, forKey: "maskAnimation")
        }
        
        
    }
    

