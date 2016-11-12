//
//  RotationOptions.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 10/13/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import Foundation
import UIKit


struct objectDrawing {
    static let heighlightWidth = 2.0
    static let heighlightPadding = 1.0
    static let lineWidthOnCanvas = 3.0
    static let initialObjectSize = CGFloat(150)
    static let buttonSize = CGFloat(55)
}



let SHAPES : [String] = ["square_400", "circle_400", "arrow_400", "triangle_right"]

struct objectOptions {
    static let initialShrinkFactor: CGFloat = CGFloat(4.0)
}

let RotationOrientation: [String : Int] = [
    "clockwise" : 1,
    "counterClockwise" : -1
]

struct RotationAngleInDegree {
    static let five_degree: CGFloat     = CGFloat(Float.pi / 180 * 5)
    static let ten_degree: CGFloat      = CGFloat(Float.pi / 180 * 10)
    static let twenty_degree: CGFloat   = CGFloat(Float.pi / 180 * 20)
    static let thirty_degree: CGFloat   = CGFloat(Float.pi / 180 * 30)
    static let sixty_degree: CGFloat   = CGFloat(Float.pi / 180 * 60)
    static let ninety_degree: CGFloat   = CGFloat(Float.pi / 180 * 90)
    static let hundred_eighty_degree: CGFloat   = CGFloat(Float.pi / 180 * 180)
}

let RotationDegree: [Int : CGFloat] = [
    5 : CGFloat(Float.pi / 180 * 5),
    10 : CGFloat(Float.pi / 180 * 10),
    20 : CGFloat(Float.pi / 180 * 20),
    30 : CGFloat(Float.pi / 180 * 30),
    60 : CGFloat(Float.pi / 180 * 60),
    90 : CGFloat(Float.pi / 180 * 90),
    180 : CGFloat(Float.pi / 180 * 180)
]

struct Rotation {
    static let defaultRotationDegree = 30
    static let defaultRotationOrientation = "clockwise"
}

struct Animation {
    static let RotateDuration = 0.3
}

struct Navigation {
    static let shiftDistance: CGFloat = CGFloat(10.0)
    static let shiftDuration = 0.3
    static let longPressDefaultDuration = 0.2
}


// communication protocal between rotation popover presentation 
// controller and its parent view controller
@objc protocol RotationPopoverPresentationControllerDelegate {
    func updateRotationOrientation(_ orientation: String)
    func updateRotationDegree(_ degree: Int)
}
