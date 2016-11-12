//
//  SunObject.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class SunObject: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let frame = CGRect(x: 0, y: 0, width: 512, height: 476)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 90.92, y: frame.minY + 128.78))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 94.13, y: frame.minY + 124.28))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 96.28, y: frame.minY + 121.52), controlPoint1: CGPoint(x: frame.minX + 94.8, y: frame.minY + 123.34), controlPoint2: CGPoint(x: frame.minX + 95.57, y: frame.minY + 122.45))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 96.39, y: frame.minY + 121.77))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 100.11, y: frame.minY + 117.32))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 116.34, y: frame.minY + 100.89), controlPoint1: CGPoint(x: frame.minX + 104.98, y: frame.minY + 111.46), controlPoint2: CGPoint(x: frame.minX + 110.54, y: frame.minY + 105.78))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 120.79, y: frame.minY + 97.13))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 120.58, y: frame.minY + 97.03))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 122.98, y: frame.minY + 95.13), controlPoint1: CGPoint(x: frame.minX + 121.39, y: frame.minY + 96.42), controlPoint2: CGPoint(x: frame.minX + 122.16, y: frame.minY + 95.73))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 127.38, y: frame.minY + 91.9))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 58.19, y: frame.minY + 58.47))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 62.05, y: frame.minY + 66.76))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 90.92, y: frame.minY + 128.78))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 71.43, y: frame.minY + 220.37))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 71.05, y: frame.minY + 217.12), controlPoint1: CGPoint(x: frame.minX + 71.26, y: frame.minY + 219.3), controlPoint2: CGPoint(x: frame.minX + 71.19, y: frame.minY + 218.2))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 71.35, y: frame.minY + 217.22))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 70.84, y: frame.minY + 211.42))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 70.32, y: frame.minY + 200.14), controlPoint1: CGPoint(x: frame.minX + 70.52, y: frame.minY + 207.67), controlPoint2: CGPoint(x: frame.minX + 70.32, y: frame.minY + 203.9))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 70.84, y: frame.minY + 188.3), controlPoint1: CGPoint(x: frame.minX + 70.32, y: frame.minY + 196.14), controlPoint2: CGPoint(x: frame.minX + 70.5, y: frame.minY + 192.19))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 71.37, y: frame.minY + 182.46))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 71.06, y: frame.minY + 182.58))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 71.43, y: frame.minY + 179.33), controlPoint1: CGPoint(x: frame.minX + 71.2, y: frame.minY + 181.49), controlPoint2: CGPoint(x: frame.minX + 71.26, y: frame.minY + 180.4))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 72.3, y: frame.minY + 173.89))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 67.17, y: frame.minY + 175.74))
        bezierPath.addLine(to: CGPoint(x: frame.minX, y: frame.minY + 199.85))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 72.28, y: frame.minY + 225.79))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 71.43, y: frame.minY + 220.37))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 180.92, y: frame.minY + 71.79))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 180.81, y: frame.minY + 72.12))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 186.55, y: frame.minY + 71.58))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 198, y: frame.minY + 71.06), controlPoint1: CGPoint(x: frame.minX + 190.35, y: frame.minY + 71.26), controlPoint2: CGPoint(x: frame.minX + 194.16, y: frame.minY + 71.06))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 209.45, y: frame.minY + 71.58), controlPoint1: CGPoint(x: frame.minX + 201.84, y: frame.minY + 71.06), controlPoint2: CGPoint(x: frame.minX + 205.65, y: frame.minY + 71.26))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 215.18, y: frame.minY + 72.12))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 215.07, y: frame.minY + 71.79))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 218.3, y: frame.minY + 72.19), controlPoint1: CGPoint(x: frame.minX + 216.15, y: frame.minY + 71.94), controlPoint2: CGPoint(x: frame.minX + 217.24, y: frame.minY + 72.01))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 223.66, y: frame.minY + 73.06))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 197.99, y: frame.minY))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 194.96, y: frame.minY + 8.66))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 172.32, y: frame.minY + 73.06))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 177.7, y: frame.minY + 72.18))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 180.92, y: frame.minY + 71.79), controlPoint1: CGPoint(x: frame.minX + 178.76, y: frame.minY + 72.01), controlPoint2: CGPoint(x: frame.minX + 179.85, y: frame.minY + 71.94))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 275.52, y: frame.minY + 97.13))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 275.49, y: frame.minY + 97.13))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 276.54, y: frame.minY + 98.02))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 282.71, y: frame.minY + 103.49), controlPoint1: CGPoint(x: frame.minX + 278.71, y: frame.minY + 99.73), controlPoint2: CGPoint(x: frame.minX + 280.67, y: frame.minY + 101.65))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 293.35, y: frame.minY + 114.2), controlPoint1: CGPoint(x: frame.minX + 286.46, y: frame.minY + 106.84), controlPoint2: CGPoint(x: frame.minX + 290.01, y: frame.minY + 110.44))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 298.51, y: frame.minY + 120.17), controlPoint1: CGPoint(x: frame.minX + 295.1, y: frame.minY + 116.17), controlPoint2: CGPoint(x: frame.minX + 296.89, y: frame.minY + 118.09))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 299.86, y: frame.minY + 121.81))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 299.88, y: frame.minY + 121.76))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 301.86, y: frame.minY + 124.28), controlPoint1: CGPoint(x: frame.minX + 300.53, y: frame.minY + 122.61), controlPoint2: CGPoint(x: frame.minX + 301.23, y: frame.minY + 123.41))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 305.04, y: frame.minY + 128.76))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 338.14, y: frame.minY + 58.44))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 329.91, y: frame.minY + 62.42))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 268.62, y: frame.minY + 91.93))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 273.02, y: frame.minY + 95.14))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 275.52, y: frame.minY + 97.13), controlPoint1: CGPoint(x: frame.minX + 273.88, y: frame.minY + 95.76), controlPoint2: CGPoint(x: frame.minX + 274.68, y: frame.minY + 96.47))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 323.69, y: frame.minY + 226.07))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 396, y: frame.minY + 200.11))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 323.69, y: frame.minY + 174.19))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 324.56, y: frame.minY + 179.61))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 324.95, y: frame.minY + 182.86), controlPoint1: CGPoint(x: frame.minX + 324.72, y: frame.minY + 180.68), controlPoint2: CGPoint(x: frame.minX + 324.8, y: frame.minY + 181.78))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 324.63, y: frame.minY + 182.73))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 325.16, y: frame.minY + 188.57))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 325.68, y: frame.minY + 200.14), controlPoint1: CGPoint(x: frame.minX + 325.48, y: frame.minY + 192.4), controlPoint2: CGPoint(x: frame.minX + 325.68, y: frame.minY + 196.25))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 325.16, y: frame.minY + 211.7), controlPoint1: CGPoint(x: frame.minX + 325.68, y: frame.minY + 204.01), controlPoint2: CGPoint(x: frame.minX + 325.48, y: frame.minY + 207.87))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 324.63, y: frame.minY + 217.52))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 324.95, y: frame.minY + 217.41))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 324.56, y: frame.minY + 220.66), controlPoint1: CGPoint(x: frame.minX + 324.8, y: frame.minY + 218.49), controlPoint2: CGPoint(x: frame.minX + 324.72, y: frame.minY + 219.59))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 323.69, y: frame.minY + 226.07))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 215.08, y: frame.minY + 328.47))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 215.19, y: frame.minY + 328.15))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 209.44, y: frame.minY + 328.68))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 197.99, y: frame.minY + 329.21), controlPoint1: CGPoint(x: frame.minX + 205.64, y: frame.minY + 329.01), controlPoint2: CGPoint(x: frame.minX + 201.84, y: frame.minY + 329.21))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 186.55, y: frame.minY + 328.68), controlPoint1: CGPoint(x: frame.minX + 194.15, y: frame.minY + 329.21), controlPoint2: CGPoint(x: frame.minX + 190.34, y: frame.minY + 329.01))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 180.79, y: frame.minY + 328.15))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 180.91, y: frame.minY + 328.47))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 177.7, y: frame.minY + 328.07), controlPoint1: CGPoint(x: frame.minX + 179.84, y: frame.minY + 328.32), controlPoint2: CGPoint(x: frame.minX + 178.75, y: frame.minY + 328.24))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 172.34, y: frame.minY + 327.21))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 174.15, y: frame.minY + 332.38))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 197.98, y: frame.minY + 400.27))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 223.66, y: frame.minY + 327.2))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 218.3, y: frame.minY + 328.07))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 215.08, y: frame.minY + 328.47), controlPoint1: CGPoint(x: frame.minX + 217.24, y: frame.minY + 328.24), controlPoint2: CGPoint(x: frame.minX + 216.16, y: frame.minY + 328.31))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 301.86, y: frame.minY + 275.97))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 299.98, y: frame.minY + 278.39), controlPoint1: CGPoint(x: frame.minX + 301.27, y: frame.minY + 276.81), controlPoint2: CGPoint(x: frame.minX + 300.59, y: frame.minY + 277.57))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 299.88, y: frame.minY + 278.18))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 296.16, y: frame.minY + 282.68))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 282.99, y: frame.minY + 296.46), controlPoint1: CGPoint(x: frame.minX + 292.15, y: frame.minY + 287.54), controlPoint2: CGPoint(x: frame.minX + 287.65, y: frame.minY + 292.21))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 275.78, y: frame.minY + 302.85), controlPoint1: CGPoint(x: frame.minX + 280.6, y: frame.minY + 298.61), controlPoint2: CGPoint(x: frame.minX + 278.32, y: frame.minY + 300.89))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 273.28, y: frame.minY + 304.86), controlPoint1: CGPoint(x: frame.minX + 274.94, y: frame.minY + 303.5), controlPoint2: CGPoint(x: frame.minX + 274.14, y: frame.minY + 304.21))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 268.9, y: frame.minY + 308.07))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 338.19, y: frame.minY + 341.56))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 305.04, y: frame.minY + 271.54))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 301.86, y: frame.minY + 275.97))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 120.22, y: frame.minY + 302.93))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 120.47, y: frame.minY + 302.82))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 116.08, y: frame.minY + 299.09))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 100.11, y: frame.minY + 282.95), controlPoint1: CGPoint(x: frame.minX + 110.36, y: frame.minY + 294.24), controlPoint2: CGPoint(x: frame.minX + 104.91, y: frame.minY + 288.73))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 96.41, y: frame.minY + 278.5))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 96.29, y: frame.minY + 278.75))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 94.13, y: frame.minY + 275.98), controlPoint1: CGPoint(x: frame.minX + 95.59, y: frame.minY + 277.81), controlPoint2: CGPoint(x: frame.minX + 94.81, y: frame.minY + 276.93))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 90.94, y: frame.minY + 271.52))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 88.61, y: frame.minY + 276.49))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 58.18, y: frame.minY + 341.46))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 127.41, y: frame.minY + 308.36))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 122.97, y: frame.minY + 305.12))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 120.22, y: frame.minY + 302.93), controlPoint1: CGPoint(x: frame.minX + 122.03, y: frame.minY + 304.44), controlPoint2: CGPoint(x: frame.minX + 121.14, y: frame.minY + 303.65))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 310.56, y: frame.minY + 190.61))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 208.04, y: frame.minY + 312.97), controlPoint1: CGPoint(x: frame.minX + 315.6, y: frame.minY + 253.23), controlPoint2: CGPoint(x: frame.minX + 269.7, y: frame.minY + 308.01))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 87.28, y: frame.minY + 208.57), controlPoint1: CGPoint(x: frame.minX + 146.39, y: frame.minY + 317.94), controlPoint2: CGPoint(x: frame.minX + 92.32, y: frame.minY + 271.19))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 189.8, y: frame.minY + 86.21), controlPoint1: CGPoint(x: frame.minX + 82.24, y: frame.minY + 145.95), controlPoint2: CGPoint(x: frame.minX + 128.14, y: frame.minY + 91.17))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 310.56, y: frame.minY + 190.61), controlPoint1: CGPoint(x: frame.minX + 251.46, y: frame.minY + 81.25), controlPoint2: CGPoint(x: frame.minX + 305.52, y: frame.minY + 127.99))
        bezierPath.close()
        
        bezierPath.lineWidth = CGFloat(lineWidth!)
        
        bezierPath.fit(into: rectToPutImage!).moveCenter(to: rect.center).stroke()
    }


}