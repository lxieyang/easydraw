//
//  ArrowBoldObject.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class ArrowBoldObject: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let arrowHeadFactor = CGFloat(0.7)
        let arrowBarWidthFactor = CGFloat(0.10)
        let arrowWidthFactor = CGFloat(0.30)
        
        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.midY)! - (rectToPutImage?.width)! * arrowBarWidthFactor))
        arrowPath.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * arrowHeadFactor, y: (rectToPutImage?.midY)! - (rectToPutImage?.width)! * arrowBarWidthFactor))
        arrowPath.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * arrowHeadFactor, y: (rectToPutImage?.midY)! - (rectToPutImage?.width)! * arrowWidthFactor))
        arrowPath.addLine(to: CGPoint(x: (rectToPutImage?.maxX)!, y: (rectToPutImage?.midY)!))
        arrowPath.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * arrowHeadFactor, y: (rectToPutImage?.midY)! + (rectToPutImage?.width)! * arrowWidthFactor))
        arrowPath.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * arrowHeadFactor, y: (rectToPutImage?.midY)! + (rectToPutImage?.width)! * arrowBarWidthFactor))
        arrowPath.addLine(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.midY)! + (rectToPutImage?.width)! * arrowBarWidthFactor))
        arrowPath.close()
        
        arrowPath.lineWidth = CGFloat(lineWidth!)
        arrowPath.stroke()
        arrowPath.fill()
    }

}


class ArrowNarrowObject: ObjectOnCanvas {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let arrowHeadFactor = CGFloat(0.8)
        let arrowBarWidthFactor = CGFloat(0.01)
        let arrowWidthFactor = CGFloat(0.10)
        
        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.midY)! - (rectToPutImage?.width)! * arrowBarWidthFactor))
        arrowPath.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * arrowHeadFactor, y: (rectToPutImage?.midY)! - (rectToPutImage?.width)! * arrowBarWidthFactor))
        arrowPath.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * arrowHeadFactor, y: (rectToPutImage?.midY)! - (rectToPutImage?.width)! * arrowWidthFactor))
        arrowPath.addLine(to: CGPoint(x: (rectToPutImage?.maxX)!, y: (rectToPutImage?.midY)!))
        arrowPath.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * arrowHeadFactor, y: (rectToPutImage?.midY)! + (rectToPutImage?.width)! * arrowWidthFactor))
        arrowPath.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * arrowHeadFactor, y: (rectToPutImage?.midY)! + (rectToPutImage?.width)! * arrowBarWidthFactor))
        arrowPath.addLine(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.midY)! + (rectToPutImage?.width)! * arrowBarWidthFactor))
        arrowPath.close()
        
        arrowPath.lineWidth = CGFloat(lineWidth!)
        arrowPath.stroke()
        // override fill color
        fillColor = UIColor.black
        arrowPath.fill()
    }
    
}

