//
//  ViewController.swift
//  PhraseChase
//
//  Created by Martin Sitar on 2015-05-23.
//  Copyright (c) 2015 Martin Sitar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var wordDisplayLabel: UILabel!
    
    var keyCount = gameWords.count
    var randomNumber = 0
    var timer = NSTimer()
    var timeLimit = 35
    var gameIsRunning = false
    var randomKey = ""
    var randomVal: AnyObject!
    
    // timer to keep track of the rest period in between sets
    func updateTime() {
        if timeLimit == 0 {
            println("Time's up!")
            timeLimit = 35
            timer.invalidate()
            startButton.hidden = false
            startButton.setTitle("Continue", forState: UIControlState.Normal)
            gameIsRunning = false
            performSegueWithIdentifier("scoreEntry", sender: self)
            
        } else if timeLimit < 30 && timeLimit > 10 {
            timeLimit--
            //println("Hurry up!")
        } else if timeLimit < 10 {
            timeLimit--
            println("HURRRY!")
        } else {
            timeLimit--
            println(timeLimit)
        }
    }

    func randomWord() {
        // A random key is pulled from the dictionary as a string value
        randomNumber = Int(arc4random_uniform(UInt32(keyCount)))
        randomKey = gameWords.keys.array[randomNumber]
        var newDictNumber = gameWords[randomKey]!.count
        var localRandomNumber = Int(arc4random_uniform(UInt32(newDictNumber)))
        var randomValue: AnyObject! = gameWords["\(randomKey)"]![localRandomNumber]
        println(randomKey)
        println(newDictNumber)
        println(randomWord)
        
        wordDisplayLabel.text = "\(randomValue)".uppercaseString
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }

    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        // if the game is running let the shake work, come back to this
        if gameIsRunning == true {
            if event.subtype == UIEventSubtype.MotionShake {
                randomWord()
            }
        }
    }
    
    @IBAction func startButtonPressed(sender: AnyObject) {
         // wordDisplayLabel.text = randomValue
        randomNumber = Int(arc4random_uniform(UInt32(keyCount)))
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
        
        startButton.hidden = true
        gameIsRunning = true
        randomWord()
    
    }
    
}
