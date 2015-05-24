//
//  TeamScoreGraphic.swift
//  PhraseChase
//
//  Created by Martin Sitar on 2015-05-23.
//  Copyright (c) 2015 Martin Sitar. All rights reserved.
//

import UIKit
@IBDesignable


class TeamScore: UIView {
    
    override func drawRect(rect: CGRect) {
        var path = UIBezierPath(roundedRect: CGRectMake(0, 0, 150, 100), byRoundingCorners:.BottomRight | .TopRight, cornerRadii: CGSizeMake(50, 50))
        UIColor(red: 0, green: 173, blue: 253, alpha: 1).setFill()
        path.fill()
    }
    
    
}