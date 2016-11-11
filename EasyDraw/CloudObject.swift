//
//  CloudObject.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class CloudObject: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let frame = CGRect(x: 0, y: 0, width: 512, height: 384)
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 320, y: frame.minY + 32))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 416, y: frame.minY + 128), controlPoint1: CGPoint(x: frame.minX + 373.03, y: frame.minY + 32), controlPoint2: CGPoint(x: frame.minX + 416, y: frame.minY + 74.97))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 408.97, y: frame.minY + 163.69), controlPoint1: CGPoint(x: frame.minX + 416, y: frame.minY + 140.62), controlPoint2: CGPoint(x: frame.minX + 413.41, y: frame.minY + 152.62))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 480, y: frame.minY + 256), controlPoint1: CGPoint(x: frame.minX + 449.81, y: frame.minY + 174.75), controlPoint2: CGPoint(x: frame.minX + 480, y: frame.minY + 211.69))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 384, y: frame.minY + 352), controlPoint1: CGPoint(x: frame.minX + 480, y: frame.minY + 309.03), controlPoint2: CGPoint(x: frame.minX + 437.03, y: frame.minY + 352))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 112, y: frame.minY + 352))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 32, y: frame.minY + 272), controlPoint1: CGPoint(x: frame.minX + 67.81, y: frame.minY + 352), controlPoint2: CGPoint(x: frame.minX + 32, y: frame.minY + 316.19))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 112, y: frame.minY + 192), controlPoint1: CGPoint(x: frame.minX + 32, y: frame.minY + 227.81), controlPoint2: CGPoint(x: frame.minX + 67.81, y: frame.minY + 192))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 119.14, y: frame.minY + 192.72), controlPoint1: CGPoint(x: frame.minX + 114.45, y: frame.minY + 192), controlPoint2: CGPoint(x: frame.minX + 116.75, y: frame.minY + 192.5))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 112, y: frame.minY + 160), controlPoint1: CGPoint(x: frame.minX + 114.64, y: frame.minY + 182.72), controlPoint2: CGPoint(x: frame.minX + 112, y: frame.minY + 171.69))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 192, y: frame.minY + 80), controlPoint1: CGPoint(x: frame.minX + 112, y: frame.minY + 115.81), controlPoint2: CGPoint(x: frame.minX + 147.81, y: frame.minY + 80))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 231.48, y: frame.minY + 90.81), controlPoint1: CGPoint(x: frame.minX + 206.44, y: frame.minY + 80), controlPoint2: CGPoint(x: frame.minX + 219.8, y: frame.minY + 84.12))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 320, y: frame.minY + 32), controlPoint1: CGPoint(x: frame.minX + 246.02, y: frame.minY + 56.25), controlPoint2: CGPoint(x: frame.minX + 280.16, y: frame.minY + 32))
        bezierPath.close()
        
        bezierPath.lineWidth = CGFloat(lineWidth!)
        
        bezierPath.fit(into: rectToPutImage!).moveCenter(to: rect.center).stroke()
    }


}
