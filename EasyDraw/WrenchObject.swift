//
//  WrenchObject.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class WrenchObject: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let frame = CGRect(x: 0, y: 0, width: 122, height: 121)
        
        let path4147Path = UIBezierPath()
        path4147Path.move(to: CGPoint(x: frame.minX + 9.78, y: frame.minY + 118.24))
        path4147Path.addCurve(to: CGPoint(x: frame.minX + 1.31, y: frame.minY + 95.85), controlPoint1: CGPoint(x: frame.minX + 1.44, y: frame.minY + 114.45), controlPoint2: CGPoint(x: frame.minX - 2.15, y: frame.minY + 104.97))
        path4147Path.addCurve(to: CGPoint(x: frame.minX + 28.06, y: frame.minY + 66.64), controlPoint1: CGPoint(x: frame.minX + 2.09, y: frame.minY + 93.79), controlPoint2: CGPoint(x: frame.minX + 14.12, y: frame.minY + 80.64))
        path4147Path.addLine(to: CGPoint(x: frame.minX + 53.38, y: frame.minY + 41.18))
        path4147Path.addLine(to: CGPoint(x: frame.minX + 53.72, y: frame.minY + 32.64))
        path4147Path.addCurve(to: CGPoint(x: frame.minX + 72.55, y: frame.minY + 3.01), controlPoint1: CGPoint(x: frame.minX + 54.24, y: frame.minY + 19.72), controlPoint2: CGPoint(x: frame.minX + 60.89, y: frame.minY + 9.25))
        path4147Path.addCurve(to: CGPoint(x: frame.minX + 103.13, y: frame.minY + 2.95), controlPoint1: CGPoint(x: frame.minX + 80.02, y: frame.minY - 0.98), controlPoint2: CGPoint(x: frame.minX + 95.69, y: frame.minY - 1.01))
        path4147Path.addLine(to: CGPoint(x: frame.minX + 108.37, y: frame.minY + 5.74))
        path4147Path.addLine(to: CGPoint(x: frame.minX + 95.46, y: frame.minY + 12.7))
        path4147Path.addLine(to: CGPoint(x: frame.minX + 82.55, y: frame.minY + 19.66))
        path4147Path.addLine(to: CGPoint(x: frame.minX + 82.55, y: frame.minY + 28.17))
        path4147Path.addLine(to: CGPoint(x: frame.minX + 82.55, y: frame.minY + 36.69))
        path4147Path.addLine(to: CGPoint(x: frame.minX + 89.78, y: frame.minY + 41.31))
        path4147Path.addLine(to: CGPoint(x: frame.minX + 97, y: frame.minY + 45.93))
        path4147Path.addLine(to: CGPoint(x: frame.minX + 109.35, y: frame.minY + 39.36))
        path4147Path.addCurve(to: CGPoint(x: frame.minX + 122.27, y: frame.minY + 33.38), controlPoint1: CGPoint(x: frame.minX + 116.14, y: frame.minY + 35.75), controlPoint2: CGPoint(x: frame.minX + 121.96, y: frame.minY + 33.06))
        path4147Path.addCurve(to: CGPoint(x: frame.minX + 121.22, y: frame.minY + 40.77), controlPoint1: CGPoint(x: frame.minX + 122.59, y: frame.minY + 33.7), controlPoint2: CGPoint(x: frame.minX + 122.12, y: frame.minY + 37.02))
        path4147Path.addCurve(to: CGPoint(x: frame.minX + 86.89, y: frame.minY + 67.67), controlPoint1: CGPoint(x: frame.minX + 117.17, y: frame.minY + 57.63), controlPoint2: CGPoint(x: frame.minX + 104.15, y: frame.minY + 67.83))
        path4147Path.addLine(to: CGPoint(x: frame.minX + 77.71, y: frame.minY + 67.58))
        path4147Path.addLine(to: CGPoint(x: frame.minX + 53.8, y: frame.minY + 91.65))
        path4147Path.addCurve(to: CGPoint(x: frame.minX + 17.22, y: frame.minY + 120.71), controlPoint1: CGPoint(x: frame.minX + 31.53, y: frame.minY + 114.05), controlPoint2: CGPoint(x: frame.minX + 23.16, y: frame.minY + 120.71))
        path4147Path.addCurve(to: CGPoint(x: frame.minX + 9.78, y: frame.minY + 118.24), controlPoint1: CGPoint(x: frame.minX + 16.12, y: frame.minY + 120.71), controlPoint2: CGPoint(x: frame.minX + 12.77, y: frame.minY + 119.6))
        path4147Path.close()
        
        path4147Path.lineWidth = CGFloat(lineWidth!)
        
        path4147Path.fit(into: rectToPutImage!).moveCenter(to: rect.center).stroke()
        
        fillColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        path4147Path.fit(into: rectToPutImage!).moveCenter(to: rect.center).fill()
    }


}
