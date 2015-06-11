//
//  Winner.swift
//  PhraseChase
//
//  Created by Martin Sitar on 2015-06-03.
//  Copyright (c) 2015 Martin Sitar. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class Winner: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var iMinSessions = 3
    var iTryAgainSessions = 6
    var player2:AVAudioPlayer = AVAudioPlayer()
    
    
    func showRateMe() {
        var alert = UIAlertController(title: "Rate Us", message: "Thanks for using <APP NAME>", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Rate <APP NAME>", style: UIAlertActionStyle.Default, handler: { alertAction in
            UIApplication.sharedApplication().openURL(NSURL(string : "itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=<iTUNES CONNECT APP ID>")!)
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "No Thanks", style: UIAlertActionStyle.Default, handler: { alertAction in
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "neverRate")
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Maybe Later", style: UIAlertActionStyle.Default, handler: { alertAction in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func rateMe() {
        var neverRate = NSUserDefaults.standardUserDefaults().boolForKey("neverRate")
        var numLaunches = NSUserDefaults.standardUserDefaults().integerForKey("numLaunches") + 1
        
        if (!neverRate && (numLaunches == iMinSessions || numLaunches >= (iMinSessions + iTryAgainSessions + 1)))
        {
            showRateMe()
            numLaunches = iMinSessions + 1
        }
        NSUserDefaults.standardUserDefaults().setInteger(numLaunches, forKey: "numLaunches")
    }
    
    
    // Plays the winning sound
    func playWinner() {
        var audioPath = NSBundle.mainBundle().pathForResource("Victory", ofType: "mp3")!
        var error : NSError? = nil
        
        player2 = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath), error: &error)
        
        if error == nil {
            player2.play()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        playWinner()
        
        if pointsA > pointsB {
            winnerLabel.text = "TEAM A WINS!"
            backgroundImage.image = UIImage(named: ("teamAbg"))
        } else {
            winnerLabel.text = "TEAM B WINS!"
            backgroundImage.image = UIImage(named: ("teamBbg"))
        }
        
        playAgainButton.layer.cornerRadius = 22
        rateMe()
    }

    @IBAction func playAgainPressed(sender: AnyObject) {
        pointsA = 0
        pointsB = 0
        timeIsRunning = false
        
    }
    
    
    
}