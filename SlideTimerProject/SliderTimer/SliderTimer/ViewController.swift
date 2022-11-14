//
//  ViewController.swift
//  SliderTimer
//
//  Created by 황지우 on 2022/11/13.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timeSlider: UISlider!
    
    // timer
    var timer = Timer()
    var realTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultTitle()
        resetSlider()
    }
    
    func setDefaultTitle(){
        titleLabel.text = "초를 선택하세요."
    }
    
    func resetSlider(){
        // 슬라이더의 위치를 초기 위치로 호출하기(가운데로)
        // animated 는 슬라이드가 움직이는 모션 구현 여부.
        timeSlider.setValue(0.5, animated: true)
    }

    @IBAction func sliderSlided(_ sender: UISlider) {
        // 슬라이더의 공을 잡고 움직일때마다 계속 실행되는 함수.
        // 슬라이더가 멈춘 위치의 비율에 따라 0~60 사이의 수 할당.
        // 해당 수로 타이틀 텍스트 변경
        let designatedTime = Int(sender.value*60)
        titleLabel.text = "\(designatedTime)초"
        realTime = designatedTime
        
    }
    
    @IBAction func resetButtonTouched(_ sender: UIButton) {
        timer.invalidate()
        setDefaultTitle()
        resetSlider()
    }
   
    func reapeatSlidingToLeft() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
    
            if self.realTime > 0 { // time 이 0보다 클 때 실행.
                self.realTime -= 1
                // 왼쪽으로 한 칸 슬라이드
                self.timeSlider.value = Float(self.realTime)/Float(60)
                //self.timeSlider.value = Float(self.realTime/60) -> (x) Int의 나눗셈의 몫이므로,60보다 작으면 항상 0이 나온다.
                // print(self.timeSlider.value)
                self.titleLabel.text = "\(self.realTime)초"
            }
            else {
                self.realTime = 0
            }
            
                
            })
    }
    
    @IBAction func startButtonTouched(_ sender: UIButton) {
        reapeatSlidingToLeft()
    }
    
   
    
}

