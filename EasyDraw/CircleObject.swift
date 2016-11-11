//
//  buttonView.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/9/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class CircleObject: ObjectOnCanvas {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let ovalPath = UIBezierPath(ovalIn: rectToPutImage!)
        ovalPath.lineWidth = CGFloat(lineWidth!)
        ovalPath.stroke()
        ovalPath.fill()
    }

}
