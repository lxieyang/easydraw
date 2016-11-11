//
//  LeftRightTriangle.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class LeftRightTriangle: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.minY)!))
        trianglePath.addLine(to: CGPoint(x: (rectToPutImage?.minX)!, y: (rectToPutImage?.maxY)!))
        trianglePath.addLine(to: CGPoint(x: (rectToPutImage?.maxX)!, y: (rectToPutImage?.maxY)!))
        trianglePath.close()
        trianglePath.lineWidth = CGFloat(lineWidth!)
        trianglePath.stroke()
        trianglePath.fill()
    }

}
