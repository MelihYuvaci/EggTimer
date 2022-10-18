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
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    var alarmSound : AVAudioPlayer!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle! // Soft, Medium, Hard
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        textLabel.text = hardness
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
          //  print(Float(secondsPassed) / Float(totalTime))
        
            
        }else{
            timer.invalidate()
            textLabel.text = "DONE!"
            playSound()
        }
        
    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        alarmSound = try! AVAudioPlayer(contentsOf: url!)
        alarmSound.play()
        
    }
    
}


       

/*
 let softTime = 5
 let mediumTime = 7
 let hardTime = 12
 */



        /*
         switch hardness {
         case "Soft":
         print(softTime)
         case "Medium":
         print(mediumTime)
         case "Hard":
         print(hardTime)
         default:
         print("hardness is out of range")
         }
         
         if hardness == "Soft"{
         print(softTime)
         }else if hardness == "Medium"{
         print(mediumTime)
         }else{
         print(hardTime)
         }
         */
  
