//
//  StarObject.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class StarFatObject: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let starUpperWidthFactor = CGFloat(0.34)
        let starUpperHeightFactor = CGFloat(0.31)
        let starSideHeightFactor = CGFloat(0.38)
        let starLowerWidthFactor = CGFloat(0.24)
        let starLowerHeightFactor = CGFloat(0.65)
        let starBottomWidthFactor = CGFloat(0.20)
        let starMiddleHeightFactor = CGFloat(0.86)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: (rectToPutImage?.midX)!, y: (rectToPutImage?.minY)!))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * (CGFloat(1) - starUpperWidthFactor), y: (rectToPutImage?.maxY)! * starUpperHeightFactor))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)!, y: (rectToPutImage?.maxY)! * starSideHeightFactor))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * (CGFloat(1) - starLowerWidthFactor), y: (rectToPutImage?.maxY)! * starLowerHeightFactor))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * (CGFloat(1) - starBottomWidthFactor), y: (rectToPutImage?.maxY)!))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)!, y: (rectToPutImage?.maxY)! * starMiddleHeightFactor))

        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * starBottomWidthFactor, y: (rectToPutImage?.maxY)!))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * starLowerWidthFactor, y: (rectToPutImage?.maxY)! * starLowerHeightFactor))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.maxY)! * starSideHeightFactor))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * starUpperWidthFactor, y: (rectToPutImage?.maxY)! * starUpperHeightFactor))

        path.close()
        
        path.lineWidth = CGFloat(lineWidth!)
        path.stroke()
        path.fill()
    }

}




class StarThinObject: ObjectOnCanvas {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let starUpperWidthFactor = CGFloat(0.37)
        let starUpperHeightFactor = CGFloat(0.36)
        let starSideHeightFactor = CGFloat(0.39)
        let starLowerWidthFactor = CGFloat(0.29)
        let starLowerHeightFactor = CGFloat(0.63)
        let starBottomWidthFactor = CGFloat(0.20)
        let starMiddleHeightFactor = CGFloat(0.80)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: (rectToPutImage?.midX)!, y: (rectToPutImage?.minY)!))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * (CGFloat(1) - starUpperWidthFactor), y: (rectToPutImage?.maxY)! * starUpperHeightFactor))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)!, y: (rectToPutImage?.maxY)! * starSideHeightFactor))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * (CGFloat(1) - starLowerWidthFactor), y: (rectToPutImage?.maxY)! * starLowerHeightFactor))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * (CGFloat(1) - starBottomWidthFactor), y: (rectToPutImage?.maxY)!))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)!, y: (rectToPutImage?.maxY)! * starMiddleHeightFactor))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * starBottomWidthFactor, y: (rectToPutImage?.maxY)!))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * starLowerWidthFactor, y: (rectToPutImage?.maxY)! * starLowerHeightFactor))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.maxY)! * starSideHeightFactor))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)! * starUpperWidthFactor, y: (rectToPutImage?.maxY)! * starUpperHeightFactor))
        
        path.close()
        
        path.lineWidth = CGFloat(lineWidth!)
        path.stroke()
        path.fill()
    }
    
}
