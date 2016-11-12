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
        let frame = CGRect(x: 0, y: 0, width: 101, height: 90)
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 70.16, y: frame.minY + 8.57))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 90.4, y: frame.minY + 45))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 70.16, y: frame.minY + 81.43))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 29.84, y: frame.minY + 81.43))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 9.6, y: frame.minY + 45))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 29.84, y: frame.minY + 8.57))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 70.16, y: frame.minY + 8.57))
        bezierPath.close()
        bezierPath.lineWidth = CGFloat(lineWidth!)
        bezierPath.fit(into: rectToPutImage!).moveCenter(to: rect.center).stroke()

    }

}
