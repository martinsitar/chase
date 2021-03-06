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
import iAd

var pointsA = 0
var pointsB = 0
var winningScore = 2

class PointRecord: UIViewController, ADBannerViewDelegate {

    @IBOutlet weak var adBanner: ADBannerView!
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
    
    override func viewWillAppear(animated: Bool) {
        teamAButton.layer.cornerRadius = 20
        teamBButton.layer.cornerRadius = 20
    }
    
    override func viewDidLoad() {
        self.canDisplayBannerAds = true
        adBanner.delegate = self
        adBanner.hidden = true
    }
    
    @IBAction func teamAButtonPressed(sender: AnyObject) {
        pointsA++
        println(pointsA)
        
        
        
        if pointsA == winningScore || pointsB == winningScore {
            println("Game Over!")
            performSegueWithIdentifier("showWinner", sender: self)
            gameIsRunning = false
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
            gameIsRunning = false
        } else {
            performSegueWithIdentifier("teamBPoint", sender: self)
            playPoint()
        }

    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        NSLog("Error!")
        adBanner.hidden = true
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        adBanner.hidden = false
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        
    }
    
    
    

}