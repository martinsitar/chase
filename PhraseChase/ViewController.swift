//
//  ViewController.swift
//  PhraseChase
//
//  Created by Martin Sitar on 2015-05-23.
//  Copyright (c) 2015 Martin Sitar. All rights reserved.
//

import UIKit
import AVFoundation

var timeIsRunning = false
var gameIsRunning = false

class ViewController: UIViewController {

    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var wordDisplayLabel: UILabel!
    @IBOutlet weak var teamAScore: UILabel!
    @IBOutlet weak var teamBScore: UILabel!
    @IBOutlet weak var skipButton: UIButton!
    
    var keyCount = gameWords.count
    var randomNumber = 0
    var timer = NSTimer()
    var randomKey = ""
    var randomVal: AnyObject!
    var timeLimit = 10
    var player:AVAudioPlayer = AVAudioPlayer()
    var player2:AVAudioPlayer = AVAudioPlayer()
    var player3:AVAudioPlayer = AVAudioPlayer()
    var player4:AVAudioPlayer = AVAudioPlayer()
    
    // This function plays the countdown sound
    func playTimer() {
        // Set up the audio player to play the timer audio
        var audioPath = NSBundle.mainBundle().pathForResource("momentum", ofType: "mp3")!
        var error : NSError? = nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath), error: &error)
        
        player.volume = 1
        player.enableRate = true
        player.numberOfLoops = -1
        player.prepareToPlay()
        
        /* if timeIsRunning == true {
            player.prepareToPlay()
            player.play()
        } else if timeIsRunning == false {
            player.stop()
        } */
    }
    
    // Plays the buzzer
    func playBuzzer() {
        var audioPath = NSBundle.mainBundle().pathForResource("buzzer", ofType: "mp3")!
        var error : NSError? = nil
        
        player3 = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath), error: &error)
        
        player3.prepareToPlay()
        
        if error == nil {
            player3.play()
        }
    }
    
    // Plays the skip sound
    func playSkip() {
        var audioPath = NSBundle.mainBundle().pathForResource("skipword", ofType: "mp3")!
        var error : NSError? = nil
        
        player4 = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath), error: &error)
        
        player4.prepareToPlay()
        
        if error == nil {
            player4.play()
        }
    }
    
    // timer to keep track of the rest period in between sets
    func updateTime() {
        // First statement resets everything before the session ran. Stop & reset the timer, show the start button, change it to continue. Set the game running variable to false, send user to record the score on the other vc.
        if timeLimit == 0 {
            println("Time's up!")
            timer.invalidate()
            timeIsRunning = false
            performSegueWithIdentifier("scoreEntry", sender: self)
            player.stop()
            playBuzzer()
        } else if timeLimit < 30 && timeLimit > 10 {
            player.rate = 1.2
            timeLimit--
        } else if timeLimit < 10 {
            player.rate = 1.6
            timeLimit--
        } else {
            timeLimit--
            println(timeLimit)
            player.play()
        }

    }

    func randomWord() {
        // A random key is pulled from the dictionary as a string value.
        randomNumber = Int(arc4random_uniform(UInt32(keyCount)))
        randomKey = gameWords.keys.array[randomNumber]
        var newDictNumber = gameWords[randomKey]!.count
        var localRandomNumber = Int(arc4random_uniform(UInt32(newDictNumber)))
        var randomValue: AnyObject! = gameWords["\(randomKey)"]![localRandomNumber]
        println(randomKey)
        println(newDictNumber)
        println(randomWord)
        
        wordDisplayLabel.adjustsFontSizeToFitWidth = true
        wordDisplayLabel.text = "\(randomValue)".uppercaseString
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        // Set the labels on the main screen to current score.
        teamAScore.text = "\(pointsA)"
        teamBScore.text = "\(pointsB)"

        startButton.layer.cornerRadius = 27
        skipButton.layer.cornerRadius = 27
        startButton.hidden = false
        skipButton.hidden = true
        if gameIsRunning == true {
            startButton.setTitle("CONTINUE", forState: UIControlState.Normal)
        } else {
            startButton.setTitle("LET'S START", forState: UIControlState.Normal)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }
    
    /*
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        // if the game is running let the shake work, come back to this
        if timeIsRunning == true {
            if event.subtype == UIEventSubtype.MotionShake {
                randomWord()
            }
        }
    }
    */
    
    @IBAction func skipButtonPressed(sender: AnyObject) {
        // if the game is running let the shake work, come back to this
        if timeIsRunning == true {
                randomWord()
            }
        playSkip()
    }
    
    
    @IBAction func startButtonPressed(sender: AnyObject) {
        
        startButton.hidden = true
        skipButton.hidden = false
        gameIsRunning = true
        timeIsRunning = true
        
        randomNumber = Int(arc4random_uniform(UInt32(keyCount)))
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
        
        // Generate a random word
        randomWord()
        playTimer()
    }
    
}
