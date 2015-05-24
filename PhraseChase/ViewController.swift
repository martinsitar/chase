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
    
    var arrayCount = 0
    var randomNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        hello
        test
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButtonPressed(sender: AnyObject) {
        arrayCount = animals.count
        randomNumber = Int(arc4random_uniform(UInt32(arrayCount)))
        println(randomNumber)
        
    
    }
    
}
