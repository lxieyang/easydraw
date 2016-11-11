//
//  Smileobject.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class Smileobject: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let frame = CGRect(x: 0, y: 0, width: 448, height: 476)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 224, y: frame.minY + 60))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 416, y: frame.minY + 252), controlPoint1: CGPoint(x: frame.minX + 329.88, y: frame.minY + 60), controlPoint2: CGPoint(x: frame.minX + 416, y: frame.minY + 146.12))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 224, y: frame.minY + 444), controlPoint1: CGPoint(x: frame.minX + 416, y: frame.minY + 357.88), controlPoint2: CGPoint(x: frame.minX + 329.88, y: frame.minY + 444))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 32, y: frame.minY + 252), controlPoint1: CGPoint(x: frame.minX + 118.12, y: frame.minY + 444), controlPoint2: CGPoint(x: frame.minX + 32, y: frame.minY + 357.88))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 224, y: frame.minY + 60), controlPoint1: CGPoint(x: frame.minX + 32, y: frame.minY + 146.12), controlPoint2: CGPoint(x: frame.minX + 118.12, y: frame.minY + 60))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 224, y: frame.minY + 28))
        bezierPath.addCurve(to: CGPoint(x: frame.minX, y: frame.minY + 252), controlPoint1: CGPoint(x: frame.minX + 100.28, y: frame.minY + 28), controlPoint2: CGPoint(x: frame.minX, y: frame.minY + 128.28))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 224, y: frame.minY + 476), controlPoint1: CGPoint(x: frame.minX, y: frame.minY + 375.72), controlPoint2: CGPoint(x: frame.minX + 100.28, y: frame.minY + 476))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 448, y: frame.minY + 252), controlPoint1: CGPoint(x: frame.minX + 347.72, y: frame.minY + 476), controlPoint2: CGPoint(x: frame.minX + 448, y: frame.minY + 375.72))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 224, y: frame.minY + 28), controlPoint1: CGPoint(x: frame.minX + 448, y: frame.minY + 128.28), controlPoint2: CGPoint(x: frame.minX + 347.72, y: frame.minY + 28))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 224, y: frame.minY + 28))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 160, y: frame.minY + 140))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 128, y: frame.minY + 188), controlPoint1: CGPoint(x: frame.minX + 142.31, y: frame.minY + 140), controlPoint2: CGPoint(x: frame.minX + 128, y: frame.minY + 161.5))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 160, y: frame.minY + 236), controlPoint1: CGPoint(x: frame.minX + 128, y: frame.minY + 214.53), controlPoint2: CGPoint(x: frame.minX + 142.31, y: frame.minY + 236))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 192, y: frame.minY + 188), controlPoint1: CGPoint(x: frame.minX + 177.69, y: frame.minY + 236), controlPoint2: CGPoint(x: frame.minX + 192, y: frame.minY + 214.53))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 160, y: frame.minY + 140), controlPoint1: CGPoint(x: frame.minX + 192, y: frame.minY + 161.5), controlPoint2: CGPoint(x: frame.minX + 177.69, y: frame.minY + 140))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 288, y: frame.minY + 140))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 256, y: frame.minY + 188), controlPoint1: CGPoint(x: frame.minX + 270.31, y: frame.minY + 140), controlPoint2: CGPoint(x: frame.minX + 256, y: frame.minY + 161.5))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 288, y: frame.minY + 236), controlPoint1: CGPoint(x: frame.minX + 256, y: frame.minY + 214.53), controlPoint2: CGPoint(x: frame.minX + 270.31, y: frame.minY + 236))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 320, y: frame.minY + 188), controlPoint1: CGPoint(x: frame.minX + 305.69, y: frame.minY + 236), controlPoint2: CGPoint(x: frame.minX + 320, y: frame.minY + 214.53))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 288, y: frame.minY + 140), controlPoint1: CGPoint(x: frame.minX + 320, y: frame.minY + 161.5), controlPoint2: CGPoint(x: frame.minX + 305.69, y: frame.minY + 140))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 367.38, y: frame.minY + 288.47))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 356.47, y: frame.minY + 268.62), controlPoint1: CGPoint(x: frame.minX + 369.84, y: frame.minY + 280), controlPoint2: CGPoint(x: frame.minX + 364.97, y: frame.minY + 271.12))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 336.62, y: frame.minY + 279.5), controlPoint1: CGPoint(x: frame.minX + 348, y: frame.minY + 266.09), controlPoint2: CGPoint(x: frame.minX + 339.12, y: frame.minY + 271.06))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 224, y: frame.minY + 364), controlPoint1: CGPoint(x: frame.minX + 322.12, y: frame.minY + 329.25), controlPoint2: CGPoint(x: frame.minX + 275.81, y: frame.minY + 364))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 111.36, y: frame.minY + 279.5), controlPoint1: CGPoint(x: frame.minX + 172.19, y: frame.minY + 364), controlPoint2: CGPoint(x: frame.minX + 125.88, y: frame.minY + 329.25))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 91.51, y: frame.minY + 268.62), controlPoint1: CGPoint(x: frame.minX + 108.89, y: frame.minY + 271.06), controlPoint2: CGPoint(x: frame.minX + 100.11, y: frame.minY + 266.09))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 80.64, y: frame.minY + 288.47), controlPoint1: CGPoint(x: frame.minX + 83.03, y: frame.minY + 271.12), controlPoint2: CGPoint(x: frame.minX + 78.17, y: frame.minY + 280))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 224, y: frame.minY + 396), controlPoint1: CGPoint(x: frame.minX + 99.11, y: frame.minY + 351.78), controlPoint2: CGPoint(x: frame.minX + 158.06, y: frame.minY + 396))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 367.38, y: frame.minY + 288.47), controlPoint1: CGPoint(x: frame.minX + 289.94, y: frame.minY + 396), controlPoint2: CGPoint(x: frame.minX + 348.88, y: frame.minY + 351.78))
        bezierPath.close()
        
        fillColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        bezierPath.fit(into: rectToPutImage!).moveCenter(to: rect.center).fill()

        
    }


}
