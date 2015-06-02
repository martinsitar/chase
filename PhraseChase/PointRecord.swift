//
//  PointRecord.swift
//  PhraseChase
//
//  Created by Martin Sitar on 2015-05-28.
//  Copyright (c) 2015 Martin Sitar. All rights reserved.
//

import UIKit

var pointsA = 0
var pointsB = 0

class PointRecord: UIViewController {

    @IBOutlet weak var teamAButton: UIButton!
    @IBOutlet weak var teamBButton: UIButton!

    
    @IBAction func teamAButtonPressed(sender: AnyObject) {
        pointsA = pointsA++
        println(pointsA)
    }
    
    
    @IBAction func teamBButtonPressed(sender: AnyObject) {
        pointsB = pointsB++
        println(pointsB)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestinationViewController : ViewController = segue.destinationViewController as! ViewController
        DestinationViewController.pointsA = teamAScore.text
        DestinationViewController.PointsB = teamAScore.text
    }
    
    
    

}