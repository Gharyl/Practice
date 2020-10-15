//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var timer = Timer()
    //a Timer variable so I can control/use it
    var player: AVAudioPlayer!
    let eggTimes = ["Soft": 360, "Medium": 480, "Hard": 720]
    // let eggTimes: [String, Int]
    @IBOutlet weak var titleImage: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelection(_ sender: UIButton) {
        self.titleImage.text = "How do you like your eggs?"
        self.progressBar.progress = 0.0
        timer.invalidate()
        //resets the timer

        let hardness = sender.currentTitle!
        var countDownBegins: Float = 0
        
        timer = Timer.scheduledTimer( withTimeInterval: 1, repeats: true) {_ in
            if Int(countDownBegins) == self.eggTimes[hardness]{
                self.titleImage.text = "Your eggs are DONE!"
                self.progressBar.progress = 1
                
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player.play()
                
                self.timer.invalidate()
            }else{
                countDownBegins += 1
                self.progressBar.progress = Float(countDownBegins/Float(self.eggTimes[hardness]!))
            }
        }
    }
}
