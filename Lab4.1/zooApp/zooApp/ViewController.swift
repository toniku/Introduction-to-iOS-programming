//
//  ViewController.swift
//  zooApp
//
//  Created by Toni K on 17/09/2019.
//  Copyright © 2019 Toni K. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    var specie: String = ""
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var controlSegment: UISegmentedControl!
    
    @IBAction func chooseSpecie(_ sender: Any) {
        switch controlSegment.selectedSegmentIndex {
        case 0:
            specie = "mammals"
            image1.image = UIImage(named: "Animals/bear.jpg")
            image2.image = UIImage(named: "Animals/elephant.jpg")
            image3.image = UIImage(named: "Animals/lamb.jpg")
            image4.image = UIImage(named: "Animals/wolf.jpg")
        case 1:
            specie = "birds"
            image1.image = UIImage(named: "Animals/huuhkaja.jpg")
            image2.image = UIImage(named: "Animals/peippo.jpg")
            image3.image = UIImage(named: "Animals/peukaloinen.jpg")
            image4.image = UIImage(named: "Animals/punatulkku.jpg")
        default:
            specie = "mammals"
            image1.image = UIImage(named: "Animals/bear.jpg")
            image2.image = UIImage(named: "Animals/elephant.jpg")
            image3.image = UIImage(named: "Animals/lamb.jpg")
            image4.image = UIImage(named: "Animals/wolf.jpg")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let image1Tap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        let image2Tap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        let image3Tap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        let image4Tap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        chooseSpecie((Any).self)
        image1Tap.numberOfTapsRequired = 1
        image2Tap.numberOfTapsRequired = 1
        image3Tap.numberOfTapsRequired = 1
        image4Tap.numberOfTapsRequired = 1
        image1.isUserInteractionEnabled = true
        image2.isUserInteractionEnabled = true
        image3.isUserInteractionEnabled = true
        image4.isUserInteractionEnabled = true
        image1.addGestureRecognizer(image1Tap)
        image2.addGestureRecognizer(image2Tap)
        image3.addGestureRecognizer(image3Tap)
        image4.addGestureRecognizer(image4Tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func tapDetected(sender: UITapGestureRecognizer) {
        let tappedImage = sender.view as! UIImageView
        if (specie == "mammals") {
            switch tappedImage {
            case image1:
                playSound(filename: "Animals/bear.wav")
            case image2:
                playSound(filename: "Animals/elephant.wav")
            case image3:
                playSound(filename: "Animals/lamb.wav")
            case image4:
                playSound(filename: "Animals/wolf.wav")
            default:
                return
            }
        } else {
            switch tappedImage {
            case image1:
                playSound(filename: "Animals/huuhkaja_norther_eagle_owl.mp3")
            case image2:
                playSound(filename: "Animals/peippo_chaffinch.mp3")
            case image3:
                playSound(filename: "Animals/peukaloinen_wren.mp3")
            case image4:
                playSound(filename: "Animals/punatulkku_northern_bullfinch.mp3")
            default:
                return
            }
    }
}

    func playSound(filename:String) {
        audioPlayer?.stop()
        let audioSound = Bundle.main.path(forResource: filename, ofType: nil)!
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioSound))
            audioPlayer?.play()
        }
        catch {
            print("Couldn't load sound file")
        }
    }
}


