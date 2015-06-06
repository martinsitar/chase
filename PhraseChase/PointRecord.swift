//
//  PointRecord.swift
//  PhraseChase
//
//  Created by Martin Sitar on 2015-05-28.
//  Copyright (c) 2015 Martin Sitar. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

var pointsA = 0
var pointsB = 0
var winningScore = 2

class PointRecord: UIViewController {

    @IBOutlet weak var teamAButton: UIButton!
    @IBOutlet weak var teamBButton: UIButton!
    
    var player:AVAudioPlayer = AVAudioPlayer()

    // This function plays the countdown sound
    func playPoint() {
        // Set up the audio player to play the timer audio
        var audioPath = NSBundle.mainBundle().pathForResource("point-awarded", ofType: "mp3")!
        var error : NSError? = nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath), error: &error)
        
        player.volume = 1
        player.prepareToPlay()
        
        if error == nil {
            player.play()
        }
        
        /* if gameIsRunning == true {
        player.prepareToPlay()
        player.play()
        } else if gameIsRunning == false {
        player.stop()
        } */
    }
    
    override func viewDidAppear(animated: Bool) {
    AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    
    @IBAction func teamAButtonPressed(sender: AnyObject) {
        pointsA++
        println(pointsA)
        
        
        
        if pointsA == winningScore || pointsB == winningScore {
            println("Game Over!")
            performSegueWithIdentifier("showWinner", sender: self)
        } else {
            performSegueWithIdentifier("teamAPoint", sender: self)
            playPoint()
        }

    }
    
    
    @IBAction func teamBButtonPressed(sender: AnyObject) {
        pointsB++
        println(pointsB)
        

        
        if pointsA == winningScore || pointsB == winningScore {
            println("Game Over!")
            performSegueWithIdentifier("showWinner", sender: self)
        } else {
            performSegueWithIdentifier("teamBPoint", sender: self)
            playPoint()
        }

    }
    
    
    

}