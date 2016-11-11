//
//  TrapezoidObject.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class TrapezoidTallObject: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let trapezoidWidthFactor = CGFloat(0.25)
        let trapezoidHeightFactor = CGFloat(0.00)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: (rectToPutImage?.midX)! - (rectToPutImage?.width)! * trapezoidWidthFactor, y: (rectToPutImage?.minY)! + (rectToPutImage?.height)! * trapezoidHeightFactor))
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! + (rectToPutImage?.width)! * trapezoidWidthFactor, y: (rectToPutImage?.minY)! + (rectToPutImage?.height)! * trapezoidHeightFactor))
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)!, y: (rectToPutImage?.maxY)! - (rectToPutImage?.height)! * trapezoidHeightFactor))
        path.addLine(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.maxY)! - (rectToPutImage?.height)! * trapezoidHeightFactor))
        path.close()
        
        path.lineWidth = CGFloat(lineWidth!)
        path.stroke()
        path.fill()
    }
}


class TrapezoidMidObject: ObjectOnCanvas {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let trapezoidWidthFactor = CGFloat(0.25)
        let trapezoidHeightFactor = CGFloat(0.20)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: (rectToPutImage?.midX)! - (rectToPutImage?.width)! * trapezoidWidthFactor, y: (rectToPutImage?.minY)! + (rectToPutImage?.height)! * trapezoidHeightFactor))
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! + (rectToPutImage?.width)! * trapezoidWidthFactor, y: (rectToPutImage?.minY)! + (rectToPutImage?.height)! * trapezoidHeightFactor))
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)!, y: (rectToPutImage?.maxY)! - (rectToPutImage?.height)! * trapezoidHeightFactor))
        path.addLine(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.maxY)! - (rectToPutImage?.height)! * trapezoidHeightFactor))
        path.close()
        
        path.lineWidth = CGFloat(lineWidth!)
        path.stroke()
        path.fill()
    }
}


class TrapezoidShortObject: ObjectOnCanvas {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let trapezoidWidthFactor = CGFloat(0.25)
        let trapezoidHeightFactor = CGFloat(0.35)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: (rectToPutImage?.midX)! - (rectToPutImage?.width)! * trapezoidWidthFactor, y: (rectToPutImage?.minY)! + (rectToPutImage?.height)! * trapezoidHeightFactor))
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! + (rectToPutImage?.width)! * trapezoidWidthFactor, y: (rectToPutImage?.minY)! + (rectToPutImage?.height)! * trapezoidHeightFactor))
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)!, y: (rectToPutImage?.maxY)! - (rectToPutImage?.height)! * trapezoidHeightFactor))
        path.addLine(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.maxY)! - (rectToPutImage?.height)! * trapezoidHeightFactor))
        path.close()
        
        path.lineWidth = CGFloat(lineWidth!)
        path.stroke()
        path.fill()
    }
}
