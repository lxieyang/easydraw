//
//  CrossObject.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class CrossFatObject: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let widthFactor = CGFloat(0.15)
        let width = (rectToPutImage?.width)! * widthFactor
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: (rectToPutImage?.midX)! - width, y: (rectToPutImage?.minY)!))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! + width, y: (rectToPutImage?.minY)!))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! + width, y: (rectToPutImage?.midY)! - width))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)!, y: (rectToPutImage?.midY)! - width))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)!, y: (rectToPutImage?.midY)! + width))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! + width, y: (rectToPutImage?.midY)! + width))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! + width, y: (rectToPutImage?.maxY)!))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! - width, y: (rectToPutImage?.maxY)!))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! - width, y: (rectToPutImage?.midY)! + width))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.midY)! + width))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.midY)! - width))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! - width, y: (rectToPutImage?.midY)! - width))
       
        
        path.close()
        
        path.lineWidth = CGFloat(lineWidth!)
        path.stroke()
        path.fill()
    }

}


class CrossThinObject: ObjectOnCanvas {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let widthFactor = CGFloat(0.05)
        let width = (rectToPutImage?.width)! * widthFactor
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: (rectToPutImage?.midX)! - width, y: (rectToPutImage?.minY)!))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! + width, y: (rectToPutImage?.minY)!))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! + width, y: (rectToPutImage?.midY)! - width))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)!, y: (rectToPutImage?.midY)! - width))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.maxX)!, y: (rectToPutImage?.midY)! + width))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! + width, y: (rectToPutImage?.midY)! + width))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! + width, y: (rectToPutImage?.maxY)!))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! - width, y: (rectToPutImage?.maxY)!))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! - width, y: (rectToPutImage?.midY)! + width))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.midY)! + width))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.midY)! - width))
        
        path.addLine(to: CGPoint(x: (rectToPutImage?.midX)! - width, y: (rectToPutImage?.midY)! - width))
        
        
        path.close()
        
        path.lineWidth = CGFloat(lineWidth!)
        path.stroke()
        
        fillColor = UIColor.black
        path.fill()
    }
    
}

