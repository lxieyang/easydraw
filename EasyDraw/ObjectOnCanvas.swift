//
//  ObjectOnCanvas.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/9/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class ObjectOnCanvas: UIView {
    
    var lineWidth: Double?
    var originX: Double?
    var originY: Double?
    var imageWidth: Double?
    var imageHeight: Double?
    var lineColor: UIColor? {
        didSet {
            lineColor?.setStroke()
        }
    }
    var fillColor: UIColor? {
        didSet {
            fillColor?.setFill()
        }
    }
    var rectToPutImage: CGRect?

    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        lineWidth = objectDrawing.lineWidthOnCanvas
        originX = Double(rect.minX) + lineWidth! / 2 + objectDrawing.heighlightWidth + objectDrawing.heighlightPadding
        originY = Double(rect.minY) + lineWidth! / 2 + objectDrawing.heighlightWidth + objectDrawing.heighlightPadding
        imageWidth = (Double(rect.width) - lineWidth! - objectDrawing.heighlightWidth * 2 - objectDrawing.heighlightPadding * 2)
        imageHeight = (Double(rect.height) - lineWidth!  - objectDrawing.heighlightWidth * 2 - objectDrawing.heighlightPadding * 2)
        lineColor = UIColor.black
        fillColor = UIColor.clear
        // init rect to put image in
        rectToPutImage = CGRect(x: originX!, y: originY!, width: imageWidth!, height: imageHeight!)
    }
    

}
