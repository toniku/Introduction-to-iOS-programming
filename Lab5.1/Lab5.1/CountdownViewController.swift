//
//  CountdownViewController.swift
//  Lab5.1
//
//  Created by Toni K on 24/09/2019.
//  Copyright © 2019 Toni K. All rights reserved.
//

import UIKit
import AVFoundation

class CountdownViewController: UIViewController {
    
    var minutes:Int = 0
    var seconds:Int = 0
    var totalTimeInSeconds:Int = 0
    var totalTimeText:String = ""
    var speechSynthesizer = AVSpeechSynthesizer()
    var timer = Timer()
    
    @IBOutlet weak var textViewTime: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalTimeInSeconds = minutes * 60 + seconds
        startTimer()
        let utterance = AVSpeechUtterance(string: "Timer Started")
        speechSynthesizer.speak(utterance)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Timer calls function "counter" every second
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CountdownViewController.counter), userInfo: nil, repeats: true)
    }
    
    // function counts the correct time left and displays it to user
    @objc func counter() {
        seconds -= 1
        totalTimeInSeconds -= 1
        if (totalTimeInSeconds == 0) {
            timer.invalidate()
            let utterance = AVSpeechUtterance(string: "Done")
            speechSynthesizer.speak(utterance)
            navigationController?.popViewController(animated: true)
        }
        else if (seconds == -1) {
            minutes -= 1
            seconds = 59
        }
        if (seconds < 10 && seconds > -1) {
            totalTimeText = String(minutes) + ":0" + String(seconds)
            textViewTime.text = totalTimeText
        }
        else {
            totalTimeText = String(minutes) + ":" + String(seconds)
            textViewTime.text = totalTimeText
        }
    }
}
