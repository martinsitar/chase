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
    
    var player2:AVAudioPlayer = AVAudioPlayer()
    
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
    }

    @IBAction func playAgainPressed(sender: AnyObject) {
        pointsA = 0
        pointsB = 0
        timeIsRunning = false
        
    }
    
    
    
}