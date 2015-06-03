//
//  PointRecord.swift
//  PhraseChase
//
//  Created by Martin Sitar on 2015-05-28.
//  Copyright (c) 2015 Martin Sitar. All rights reserved.
//

import UIKit

var pointsA = 1
var pointsB = 1

class PointRecord: UIViewController {

    @IBOutlet weak var teamAButton: UIButton!
    @IBOutlet weak var teamBButton: UIButton!

    
    @IBAction func teamAButtonPressed(sender: AnyObject) {
        pointsA = pointsA+1
        println(pointsA)
    }
    
    
    @IBAction func teamBButtonPressed(sender: AnyObject) {
        pointsB = pointsB+1
        println(pointsB)
        
    }
    
    
    

}