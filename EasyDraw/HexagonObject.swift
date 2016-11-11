//
//  Hexagon.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class HexagonObject: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let topHeightFactor = CGFloat(0.0175)
        let upperWidthFactor = CGFloat(0.05)
        let upperHeightFactor = CGFloat(0.26)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: (rectToPutImage?.midX)!, y: (rectToPutImage?.maxY)! * topHeightFactor))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * (CGFloat(1.0) - upperWidthFactor), y: (rectToPutImage?.maxY)! * upperHeightFactor))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * (CGFloat(1.0) - upperWidthFactor), y: (rectToPutImage?.maxY)! * (CGFloat(1.0) - upperHeightFactor)))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)!, y: (rectToPutImage?.maxY)! * (CGFloat(1.0) - topHeightFactor)))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * upperWidthFactor, y: (rectToPutImage?.maxY)! * (CGFloat(1.0) - upperHeightFactor)))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * upperWidthFactor, y: (rectToPutImage?.maxY)! * upperHeightFactor))
    
        path.close()
        
        path.lineWidth = CGFloat(lineWidth!)
        path.stroke()
        path.fill()
    }

}
