//
//  ParallelogramObject.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class ParallelogramObject: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let widthFactor = CGFloat(0.30)
        let heightFactor = CGFloat(0.10)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.maxY)! * (CGFloat(1.0) - heightFactor)))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * widthFactor, y: (rectToPutImage?.maxY)! * heightFactor))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)!, y: (rectToPutImage?.maxY)! * heightFactor))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * (CGFloat(1.0) - widthFactor), y: (rectToPutImage?.maxY)! * (CGFloat(1.0) - heightFactor)))
        
        path.close()
        
        path.lineWidth = CGFloat(lineWidth!)
        path.stroke()
        path.fill()
    }

}
