//
//  HeartObject.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class HeartObject: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let frame = CGRect(x: 0, y: 0, width: 980, height: 880)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 490, y: frame.minY + 879.7))
        
        bezierPath.addLine(to: CGPoint(x: frame.minX + 471.9, y: frame.minY + 861.6))

        bezierPath.addCurve(to: CGPoint(x: frame.minX + 384.2, y: frame.minY + 789.4), controlPoint1: CGPoint(x: frame.minX + 448.7, y: frame.minY + 838.4), controlPoint2: CGPoint(x: frame.minX + 428.1, y: frame.minY + 822.9))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 281, y: frame.minY + 709.5), controlPoint1: CGPoint(x: frame.minX + 358.4, y: frame.minY + 768.8), controlPoint2: CGPoint(x: frame.minX + 324.9, y: frame.minY + 745.6))
        bezierPath.addCurve(to: CGPoint(x: frame.minX, y: frame.minY + 304.6), controlPoint1: CGPoint(x: frame.minX + 159.9, y: frame.minY + 616.7), controlPoint2: CGPoint(x: frame.minX, y: frame.minY + 487.7))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 283.7, y: frame.minY + 2.9), controlPoint1: CGPoint(x: frame.minX, y: frame.minY + 118.9), controlPoint2: CGPoint(x: frame.minX + 147, y: frame.minY + 2.9))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 490, y: frame.minY + 103.5), controlPoint1: CGPoint(x: frame.minX + 363.6, y: frame.minY + 2.9), controlPoint2: CGPoint(x: frame.minX + 435.9, y: frame.minY + 39))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 696.3, y: frame.minY + 0.3), controlPoint1: CGPoint(x: frame.minX + 544.2, y: frame.minY + 36.4), controlPoint2: CGPoint(x: frame.minX + 616.4, y: frame.minY + 0.3))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 980, y: frame.minY + 299.4), controlPoint1: CGPoint(x: frame.minX + 833, y: frame.minY + 0.3), controlPoint2: CGPoint(x: frame.minX + 980, y: frame.minY + 113.8))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 698.9, y: frame.minY + 706.9), controlPoint1: CGPoint(x: frame.minX + 980, y: frame.minY + 492.8), controlPoint2: CGPoint(x: frame.minX + 796.9, y: frame.minY + 632.1))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 639.6, y: frame.minY + 753.3))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 508.1, y: frame.minY + 861.6), controlPoint1: CGPoint(x: frame.minX + 564.8, y: frame.minY + 810), controlPoint2: CGPoint(x: frame.minX + 539, y: frame.minY + 830.7))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 490, y: frame.minY + 879.7))
        bezierPath.close()
        
        bezierPath.lineWidth = CGFloat(lineWidth!)
        
        bezierPath.fit(into: rectToPutImage!).moveCenter(to: rect.center).stroke()
    }

}
