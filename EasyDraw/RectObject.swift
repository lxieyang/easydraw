//
//  RectObject.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/9/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class RectObject: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let rectPath = UIBezierPath(rect: rectToPutImage!)
        rectPath.lineWidth = CGFloat(lineWidth!)
        rectPath.stroke()
        rectPath.fill()
    }

}
