//
//  TeamScoreGraphic.swift
//  PhraseChase
//
//  Created by Martin Sitar on 2015-05-23.
//  Copyright (c) 2015 Martin Sitar. All rights reserved.
//

import UIKit
@IBDesignable


class TeamScoreA: UIView {
    

    override func drawRect(rect: CGRect) {
        var path = UIBezierPath(roundedRect: CGRectMake(0, 0, 150, 100), byRoundingCorners:.BottomRight | .TopRight, cornerRadii: CGSizeMake(50, 50))
        UIColor(red: 0, green: 173/255, blue: 253/255, alpha: 1).setFill()
        path.fill()
        
            
    }
    
    
}

class TeamScoreB: UIView {
    
    
    override func drawRect(rect: CGRect) {
        var path = UIBezierPath(roundedRect: CGRectMake(0, 0, 150, 100), byRoundingCorners:.BottomLeft | .TopLeft, cornerRadii: CGSizeMake(50, 50))
        UIColor(red: 241/255, green: 0, blue: 65/255, alpha: 1).setFill()
        path.fill()
        
        
    }
    
    
}