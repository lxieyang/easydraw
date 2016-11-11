//
//  LightningObject.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class LightningObject: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let frame = CGRect(x: 0, y: 0, width: 512, height: 476)
        
        let path4828Path = UIBezierPath()
        path4828Path.move(to: CGPoint(x: frame.minX + 293.5, y: frame.minY + 5.2))
        path4828Path.addLine(to: CGPoint(x: frame.minX + 104.54, y: frame.minY + 192.82))
        path4828Path.addLine(to: CGPoint(x: frame.minX + 206.39, y: frame.minY + 196.29))
        path4828Path.addLine(to: CGPoint(x: frame.minX + 44.78, y: frame.minY + 352.83))
        path4828Path.addLine(to: CGPoint(x: frame.minX + 113.23, y: frame.minY + 354.07))
        path4828Path.addLine(to: CGPoint(x: frame.minX - 0.19, y: frame.minY + 476.2))
        path4828Path.addLine(to: CGPoint(x: frame.minX + 273.87, y: frame.minY + 327.23))
        path4828Path.addLine(to: CGPoint(x: frame.minX + 171.86, y: frame.minY + 328.28))
        path4828Path.addLine(to: CGPoint(x: frame.minX + 378.36, y: frame.minY + 167.57))
        path4828Path.addLine(to: CGPoint(x: frame.minX + 266.66, y: frame.minY + 167.3))
        path4828Path.addLine(to: CGPoint(x: frame.minX + 450.19, y: frame.minY + 0.19))
        path4828Path.addLine(to: CGPoint(x: frame.minX + 293.5, y: frame.minY + 5.2))
        path4828Path.close()
        
        path4828Path.lineWidth = CGFloat(lineWidth!)
        
        path4828Path.fit(into: rectToPutImage!).moveCenter(to: rect.center).stroke()
        
        fillColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        path4828Path.fit(into: rectToPutImage!).moveCenter(to: rect.center).fill()
    }


}
