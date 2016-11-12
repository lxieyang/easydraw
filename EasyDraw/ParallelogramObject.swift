//
//  ParallelogramObject.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class ParallelogramObject: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let frame = CGRect(x: 0, y: 0, width: 792, height: 293)
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 200, y: frame.minY))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 790, y: frame.minY))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 590, y: frame.minY + 290))
        bezierPath.addLine(to: CGPoint(x: frame.minX, y: frame.minY + 290))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 200, y: frame.minY))
        bezierPath.close()
        
        bezierPath.lineWidth = CGFloat(lineWidth!)
        bezierPath.fit(into: rectToPutImage!).moveCenter(to: rect.center).stroke()
    }

}
