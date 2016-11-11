//
//  PlaneObject.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class PlaneOverObject: ObjectOnCanvas {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let frame = CGRect(x: 0, y: 0, width: 512, height: 476)
        
        //// path5724 Drawing
        let path5724Path = UIBezierPath()
        path5724Path.move(to: CGPoint(x: frame.minX + 194.67, y: frame.minY))
        path5724Path.addLine(to: CGPoint(x: frame.minX + 70.64, y: frame.minY + 53.62))
        path5724Path.addCurve(to: CGPoint(x: frame.minX + 31.74, y: frame.minY + 30.18), controlPoint1: CGPoint(x: frame.minX + 60.26, y: frame.minY + 46.7), controlPoint2: CGPoint(x: frame.minX + 36.44, y: frame.minY + 32.35))
        path5724Path.addCurve(to: CGPoint(x: frame.minX + 11.39, y: frame.minY + 54.78), controlPoint1: CGPoint(x: frame.minX - 7.7, y: frame.minY + 11.96), controlPoint2: CGPoint(x: frame.minX - 5.21, y: frame.minY + 44.91))
        path5724Path.addCurve(to: CGPoint(x: frame.minX + 54.86, y: frame.minY + 81.16), controlPoint1: CGPoint(x: frame.minX + 15.93, y: frame.minY + 57.48), controlPoint2: CGPoint(x: frame.minX + 39.11, y: frame.minY + 71.96))
        path5724Path.addLine(to: CGPoint(x: frame.minX + 72.77, y: frame.minY + 215.09))
        path5724Path.addLine(to: CGPoint(x: frame.minX + 94.99, y: frame.minY + 228.25))
        path5724Path.addLine(to: CGPoint(x: frame.minX + 106.52, y: frame.minY + 107.31))
        path5724Path.addLine(to: CGPoint(x: frame.minX + 178.05, y: frame.minY + 144))
        path5724Path.addLine(to: CGPoint(x: frame.minX + 181.89, y: frame.minY + 183.22))
        path5724Path.addLine(to: CGPoint(x: frame.minX + 196.42, y: frame.minY + 191.84))
        path5724Path.addLine(to: CGPoint(x: frame.minX + 207.52, y: frame.minY + 149.44))
        path5724Path.addLine(to: CGPoint(x: frame.minX + 207.64, y: frame.minY + 149.5))
        path5724Path.addLine(to: CGPoint(x: 238.45, y: 117.97))
        path5724Path.addLine(to: CGPoint(x: frame.minX + 223.58, y: frame.minY + 109.97))
        path5724Path.addLine(to: CGPoint(x: frame.minX + 187.95, y: frame.minY + 126.87))
        path5724Path.addLine(to: CGPoint(x: frame.minX + 119.67, y: frame.minY + 84.44))
        path5724Path.addLine(to: CGPoint(x: frame.minX + 217.36, y: frame.minY + 12.25))
        path5724Path.addLine(to: CGPoint(x: frame.minX + 194.67, y: frame.minY))
        path5724Path.close()
        
        path5724Path.lineWidth = CGFloat(lineWidth!)
        
        path5724Path.fit(into: rectToPutImage!).moveCenter(to: rect.center).stroke()
        
        fillColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        path5724Path.fit(into: rectToPutImage!).moveCenter(to: rect.center).fill()
    }


}



class PlaneSideObject: ObjectOnCanvas {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let frame = CGRect(x: 0, y: 0, width: 985, height: 413)
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 507.15, y: frame.minY))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 540.06, y: frame.minY + 5.81), controlPoint1: CGPoint(x: frame.minX + 507.15, y: frame.minY), controlPoint2: CGPoint(x: frame.minX + 540.06, y: frame.minY + 5.81))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 582.39, y: frame.minY + 117.41), controlPoint1: CGPoint(x: frame.minX + 540.06, y: frame.minY + 5.81), controlPoint2: CGPoint(x: frame.minX + 578.87, y: frame.minY + 108.13))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 824.61, y: frame.minY + 106.46), controlPoint1: CGPoint(x: frame.minX + 712.76, y: frame.minY + 111.52), controlPoint2: CGPoint(x: frame.minX + 824.61, y: frame.minY + 106.46))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 905.91, y: frame.minY + 114.21), controlPoint1: CGPoint(x: frame.minX + 824.61, y: frame.minY + 106.46), controlPoint2: CGPoint(x: frame.minX + 882.68, y: frame.minY + 108.4))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 952.36, y: frame.minY + 139.37), controlPoint1: CGPoint(x: frame.minX + 929.13, y: frame.minY + 120.01), controlPoint2: CGPoint(x: frame.minX + 942.68, y: frame.minY + 135.5))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 983.33, y: frame.minY + 160.66), controlPoint1: CGPoint(x: frame.minX + 962.04, y: frame.minY + 143.24), controlPoint2: CGPoint(x: frame.minX + 981.4, y: frame.minY + 149.05))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 973.66, y: frame.minY + 181.96), controlPoint1: CGPoint(x: frame.minX + 985.27, y: frame.minY + 172.28), controlPoint2: CGPoint(x: frame.minX + 987.21, y: frame.minY + 174.21))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 948.23, y: frame.minY + 191.37), controlPoint1: CGPoint(x: frame.minX + 968.96, y: frame.minY + 184.64), controlPoint2: CGPoint(x: frame.minX + 959.39, y: frame.minY + 188.02))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 946.59, y: frame.minY + 194.49), controlPoint1: CGPoint(x: frame.minX + 953.04, y: frame.minY + 191.88), controlPoint2: CGPoint(x: frame.minX + 952.87, y: frame.minY + 192.88))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 877.15, y: frame.minY + 208.5), controlPoint1: CGPoint(x: frame.minX + 891.68, y: frame.minY + 208.5), controlPoint2: CGPoint(x: frame.minX + 898.14, y: frame.minY + 207.1))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 623.63, y: frame.minY + 216.91))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 584.87, y: frame.minY + 225.32), controlPoint1: CGPoint(x: frame.minX + 623.63, y: frame.minY + 216.91), controlPoint2: CGPoint(x: frame.minX + 599.4, y: frame.minY + 223.92))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 584.33, y: frame.minY + 225.37), controlPoint1: CGPoint(x: frame.minX + 584.71, y: frame.minY + 225.34), controlPoint2: CGPoint(x: frame.minX + 584.52, y: frame.minY + 225.35))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 563.29, y: frame.minY + 228.41), controlPoint1: CGPoint(x: frame.minX + 575.42, y: frame.minY + 227.16), controlPoint2: CGPoint(x: frame.minX + 567.47, y: frame.minY + 228.41))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 548.57, y: frame.minY + 228.54), controlPoint1: CGPoint(x: frame.minX + 561.29, y: frame.minY + 228.41), controlPoint2: CGPoint(x: frame.minX + 556.01, y: frame.minY + 228.47))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 492.82, y: frame.minY + 265.72), controlPoint1: CGPoint(x: frame.minX + 531.11, y: frame.minY + 240.19), controlPoint2: CGPoint(x: frame.minX + 506.71, y: frame.minY + 256.45))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 508.18, y: frame.minY + 263.03), controlPoint1: CGPoint(x: frame.minX + 497.63, y: frame.minY + 264.74), controlPoint2: CGPoint(x: frame.minX + 502.84, y: frame.minY + 263.81))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 563.6, y: frame.minY + 262.91), controlPoint1: CGPoint(x: frame.minX + 507.33, y: frame.minY + 263.83), controlPoint2: CGPoint(x: frame.minX + 557.79, y: frame.minY + 252.21))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 571.24, y: frame.minY + 285.88), controlPoint1: CGPoint(x: frame.minX + 569.41, y: frame.minY + 269.61), controlPoint2: CGPoint(x: frame.minX + 570.42, y: frame.minY + 271.42))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 558.17, y: frame.minY + 311.87), controlPoint1: CGPoint(x: frame.minX + 569.78, y: frame.minY + 295.79), controlPoint2: CGPoint(x: frame.minX + 567.72, y: frame.minY + 310.16))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 475.82, y: frame.minY + 305.84), controlPoint1: CGPoint(x: frame.minX + 544.62, y: frame.minY + 311.87), controlPoint2: CGPoint(x: frame.minX + 506.8, y: frame.minY + 311.65))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 437.71, y: frame.minY + 298.87), controlPoint1: CGPoint(x: frame.minX + 455.55, y: frame.minY + 302.04), controlPoint2: CGPoint(x: frame.minX + 443.57, y: frame.minY + 299.9))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 241.96, y: frame.minY + 410.37), controlPoint1: CGPoint(x: frame.minX + 372.24, y: frame.minY + 337.14), controlPoint2: CGPoint(x: frame.minX + 255.78, y: frame.minY + 404.84))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 216.8, y: frame.minY + 406.5), controlPoint1: CGPoint(x: frame.minX + 222.61, y: frame.minY + 418.11), controlPoint2: CGPoint(x: frame.minX + 216.8, y: frame.minY + 406.5))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 404.56, y: frame.minY + 265.19))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 434.27, y: frame.minY + 228.11), controlPoint1: CGPoint(x: frame.minX + 404.56, y: frame.minY + 265.19), controlPoint2: CGPoint(x: frame.minX + 419.96, y: frame.minY + 248.25))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 416.17, y: frame.minY + 226.48), controlPoint1: CGPoint(x: frame.minX + 425.3, y: frame.minY + 227.74), controlPoint2: CGPoint(x: frame.minX + 418.76, y: frame.minY + 227.22))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 412.87, y: frame.minY + 225.87), controlPoint1: CGPoint(x: frame.minX + 415.48, y: frame.minY + 226.28), controlPoint2: CGPoint(x: frame.minX + 414.36, y: frame.minY + 226.07))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 354.59, y: frame.minY + 221.74), controlPoint1: CGPoint(x: frame.minX + 396.78, y: frame.minY + 224.72), controlPoint2: CGPoint(x: frame.minX + 368.75, y: frame.minY + 222.74))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 340.47, y: frame.minY + 220.98), controlPoint1: CGPoint(x: frame.minX + 350, y: frame.minY + 221.48), controlPoint2: CGPoint(x: frame.minX + 345.28, y: frame.minY + 221.23))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 215.08, y: frame.minY + 215.51), controlPoint1: CGPoint(x: frame.minX + 317.57, y: frame.minY + 220.38), controlPoint2: CGPoint(x: frame.minX + 229.12, y: frame.minY + 217.95))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 119.81, y: frame.minY + 193.08), controlPoint1: CGPoint(x: frame.minX + 198.93, y: frame.minY + 212.71), controlPoint2: CGPoint(x: frame.minX + 119.81, y: frame.minY + 193.08))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 126.17, y: frame.minY + 194.31), controlPoint1: CGPoint(x: frame.minX + 119.81, y: frame.minY + 193.08), controlPoint2: CGPoint(x: frame.minX + 122.15, y: frame.minY + 193.55))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 108.4, y: frame.minY + 189.7), controlPoint1: CGPoint(x: frame.minX + 117.73, y: frame.minY + 192.3), controlPoint2: CGPoint(x: frame.minX + 111.25, y: frame.minY + 190.65))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 103.79, y: frame.minY + 188.3), controlPoint1: CGPoint(x: frame.minX + 107.14, y: frame.minY + 189.28), controlPoint2: CGPoint(x: frame.minX + 105.58, y: frame.minY + 188.81))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 36.78, y: frame.minY + 214.86), controlPoint1: CGPoint(x: frame.minX + 74.52, y: frame.minY + 200.06), controlPoint2: CGPoint(x: frame.minX + 36.78, y: frame.minY + 214.86))
        bezierPath.addLine(to: CGPoint(x: frame.minX, y: frame.minY + 218.73))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 65.7, y: frame.minY + 177.24), controlPoint1: CGPoint(x: frame.minX, y: frame.minY + 218.73), controlPoint2: CGPoint(x: frame.minX + 46.74, y: frame.minY + 189.22))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 52.26, y: frame.minY + 170.34), controlPoint1: CGPoint(x: frame.minX + 59.57, y: frame.minY + 175.01), controlPoint2: CGPoint(x: frame.minX + 54.6, y: frame.minY + 172.68))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 48.39, y: frame.minY + 150.98), controlPoint1: CGPoint(x: frame.minX + 44.52, y: frame.minY + 162.6), controlPoint2: CGPoint(x: frame.minX + 48.39, y: frame.minY + 150.98))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 77.43, y: frame.minY + 145.18), controlPoint1: CGPoint(x: frame.minX + 58.07, y: frame.minY + 145.18), controlPoint2: CGPoint(x: frame.minX + 77.43, y: frame.minY + 145.18))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 47.34, y: frame.minY + 95.03), controlPoint1: CGPoint(x: frame.minX + 77.43, y: frame.minY + 145.18), controlPoint2: CGPoint(x: frame.minX + 63.04, y: frame.minY + 121.19))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 25.36, y: frame.minY + 58.4), controlPoint1: CGPoint(x: frame.minX + 39.84, y: frame.minY + 82.52), controlPoint2: CGPoint(x: frame.minX + 32.03, y: frame.minY + 69.52))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 11.37, y: frame.minY + 35.08), controlPoint1: CGPoint(x: frame.minX + 19.51, y: frame.minY + 48.65), controlPoint2: CGPoint(x: frame.minX + 14.53, y: frame.minY + 40.35))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 7.74, y: frame.minY + 29.04), controlPoint1: CGPoint(x: frame.minX + 9.08, y: frame.minY + 31.26), controlPoint2: CGPoint(x: frame.minX + 7.74, y: frame.minY + 29.04))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 9.36, y: frame.minY + 28.87), controlPoint1: CGPoint(x: frame.minX + 7.74, y: frame.minY + 29.04), controlPoint2: CGPoint(x: frame.minX + 8.33, y: frame.minY + 28.97))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 44.52, y: frame.minY + 25.16), controlPoint1: CGPoint(x: frame.minX + 16.41, y: frame.minY + 28.12), controlPoint2: CGPoint(x: frame.minX + 44.2, y: frame.minY + 25.2))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 45.2, y: frame.minY + 25.71), controlPoint1: CGPoint(x: frame.minX + 44.52, y: frame.minY + 25.16), controlPoint2: CGPoint(x: frame.minX + 44.75, y: frame.minY + 25.35))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 128.75, y: frame.minY + 92.78), controlPoint1: CGPoint(x: frame.minX + 50.98, y: frame.minY + 30.35), controlPoint2: CGPoint(x: frame.minX + 92.84, y: frame.minY + 63.96))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 129.69, y: frame.minY + 87.11), controlPoint1: CGPoint(x: frame.minX + 129.22, y: frame.minY + 89.92), controlPoint2: CGPoint(x: frame.minX + 129.69, y: frame.minY + 87.11))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 150.98, y: frame.minY + 89.04))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 154.47, y: frame.minY + 113.43), controlPoint1: CGPoint(x: frame.minX + 150.98, y: frame.minY + 89.04), controlPoint2: CGPoint(x: frame.minX + 153.49, y: frame.minY + 106.57))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 181.96, y: frame.minY + 135.5), controlPoint1: CGPoint(x: frame.minX + 170.62, y: frame.minY + 126.4), controlPoint2: CGPoint(x: frame.minX + 181.96, y: frame.minY + 135.5))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 505.6, y: frame.minY + 120.88), controlPoint1: CGPoint(x: frame.minX + 181.96, y: frame.minY + 135.5), controlPoint2: CGPoint(x: frame.minX + 344.17, y: frame.minY + 128.17))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 507.15, y: frame.minY + 96.78), controlPoint1: CGPoint(x: frame.minX + 505.87, y: frame.minY + 116.38), controlPoint2: CGPoint(x: frame.minX + 506.34, y: frame.minY + 108.96))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 507.15, y: frame.minY), controlPoint1: CGPoint(x: frame.minX + 509.08, y: frame.minY + 67.82), controlPoint2: CGPoint(x: frame.minX + 507.16, y: frame.minY + 0.34))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 507.15, y: frame.minY))
        bezierPath.close()
        
        bezierPath.lineWidth = CGFloat(lineWidth!)
        
        bezierPath.fit(into: rectToPutImage!).moveCenter(to: rect.center).stroke()
        
        fillColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        bezierPath.fit(into: rectToPutImage!).moveCenter(to: rect.center).fill()
    }
    
    
}



class PlaneSeaObject: ObjectOnCanvas {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let frame = CGRect(x: 0, y: 0, width: 561, height: 389)
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 537.83, y: frame.minY + 379))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 505.83, y: frame.minY + 372.14), controlPoint1: CGPoint(x: frame.minX + 526.48, y: frame.minY + 379), controlPoint2: CGPoint(x: frame.minX + 515.53, y: frame.minY + 376.43))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 472.98, y: frame.minY + 364.82), controlPoint1: CGPoint(x: frame.minX + 495.94, y: frame.minY + 367.52), controlPoint2: CGPoint(x: frame.minX + 484.73, y: frame.minY + 364.82))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 440.14, y: frame.minY + 372.14), controlPoint1: CGPoint(x: frame.minX + 461.31, y: frame.minY + 364.82), controlPoint2: CGPoint(x: frame.minX + 450.1, y: frame.minY + 367.52))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 408.21, y: frame.minY + 379), controlPoint1: CGPoint(x: frame.minX + 430.51, y: frame.minY + 376.43), controlPoint2: CGPoint(x: frame.minX + 419.56, y: frame.minY + 379))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 376.35, y: frame.minY + 372.14), controlPoint1: CGPoint(x: frame.minX + 397, y: frame.minY + 379), controlPoint2: CGPoint(x: frame.minX + 386.05, y: frame.minY + 376.43))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 343.5, y: frame.minY + 364.82), controlPoint1: CGPoint(x: frame.minX + 366.32, y: frame.minY + 367.52), controlPoint2: CGPoint(x: frame.minX + 355.11, y: frame.minY + 364.82))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 310.65, y: frame.minY + 372.14), controlPoint1: CGPoint(x: frame.minX + 331.83, y: frame.minY + 364.82), controlPoint2: CGPoint(x: frame.minX + 320.61, y: frame.minY + 367.52))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 278.73, y: frame.minY + 379), controlPoint1: CGPoint(x: frame.minX + 300.89, y: frame.minY + 376.43), controlPoint2: CGPoint(x: frame.minX + 290.07, y: frame.minY + 379))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 246.8, y: frame.minY + 372.14), controlPoint1: CGPoint(x: frame.minX + 267.38, y: frame.minY + 379), controlPoint2: CGPoint(x: frame.minX + 256.43, y: frame.minY + 376.43))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 213.95, y: frame.minY + 364.82), controlPoint1: CGPoint(x: frame.minX + 236.84, y: frame.minY + 367.52), controlPoint2: CGPoint(x: frame.minX + 225.63, y: frame.minY + 364.82))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 181.04, y: frame.minY + 372.14), controlPoint1: CGPoint(x: frame.minX + 202.21, y: frame.minY + 364.82), controlPoint2: CGPoint(x: frame.minX + 191, y: frame.minY + 367.52))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 149.11, y: frame.minY + 379), controlPoint1: CGPoint(x: frame.minX + 171.41, y: frame.minY + 376.43), controlPoint2: CGPoint(x: frame.minX + 160.46, y: frame.minY + 379))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 117.32, y: frame.minY + 372.14), controlPoint1: CGPoint(x: frame.minX + 137.77, y: frame.minY + 379), controlPoint2: CGPoint(x: frame.minX + 126.95, y: frame.minY + 376.43))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 84.47, y: frame.minY + 364.82), controlPoint1: CGPoint(x: frame.minX + 107.23, y: frame.minY + 367.52), controlPoint2: CGPoint(x: frame.minX + 96.01, y: frame.minY + 364.82))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 51.62, y: frame.minY + 372.14), controlPoint1: CGPoint(x: frame.minX + 72.73, y: frame.minY + 364.82), controlPoint2: CGPoint(x: frame.minX + 61.52, y: frame.minY + 367.52))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 19.63, y: frame.minY + 379), controlPoint1: CGPoint(x: frame.minX + 41.79, y: frame.minY + 376.43), controlPoint2: CGPoint(x: frame.minX + 30.97, y: frame.minY + 379))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 19.63, y: frame.minY + 331.18))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 51.62, y: frame.minY + 324.32), controlPoint1: CGPoint(x: frame.minX + 30.97, y: frame.minY + 331.18), controlPoint2: CGPoint(x: frame.minX + 41.79, y: frame.minY + 328.61))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 84.47, y: frame.minY + 317), controlPoint1: CGPoint(x: frame.minX + 61.52, y: frame.minY + 319.7), controlPoint2: CGPoint(x: frame.minX + 72.73, y: frame.minY + 317))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 117.32, y: frame.minY + 324.32), controlPoint1: CGPoint(x: frame.minX + 96.01, y: frame.minY + 317), controlPoint2: CGPoint(x: frame.minX + 107.23, y: frame.minY + 319.7))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 149.11, y: frame.minY + 331.18), controlPoint1: CGPoint(x: frame.minX + 126.95, y: frame.minY + 328.61), controlPoint2: CGPoint(x: frame.minX + 137.77, y: frame.minY + 331.18))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 181.04, y: frame.minY + 324.32), controlPoint1: CGPoint(x: frame.minX + 160.46, y: frame.minY + 331.18), controlPoint2: CGPoint(x: frame.minX + 171.41, y: frame.minY + 328.61))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 213.95, y: frame.minY + 317), controlPoint1: CGPoint(x: frame.minX + 191, y: frame.minY + 319.7), controlPoint2: CGPoint(x: frame.minX + 202.21, y: frame.minY + 317))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 246.8, y: frame.minY + 324.32), controlPoint1: CGPoint(x: frame.minX + 225.63, y: frame.minY + 317), controlPoint2: CGPoint(x: frame.minX + 236.84, y: frame.minY + 319.7))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 278.73, y: frame.minY + 331.18), controlPoint1: CGPoint(x: frame.minX + 256.43, y: frame.minY + 328.61), controlPoint2: CGPoint(x: frame.minX + 267.38, y: frame.minY + 331.18))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 310.65, y: frame.minY + 324.32), controlPoint1: CGPoint(x: frame.minX + 290.07, y: frame.minY + 331.18), controlPoint2: CGPoint(x: frame.minX + 300.89, y: frame.minY + 328.61))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 343.5, y: frame.minY + 317), controlPoint1: CGPoint(x: frame.minX + 320.61, y: frame.minY + 319.7), controlPoint2: CGPoint(x: frame.minX + 331.83, y: frame.minY + 317))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 376.35, y: frame.minY + 324.32), controlPoint1: CGPoint(x: frame.minX + 355.11, y: frame.minY + 317), controlPoint2: CGPoint(x: frame.minX + 366.32, y: frame.minY + 319.7))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 408.21, y: frame.minY + 331.18), controlPoint1: CGPoint(x: frame.minX + 386.05, y: frame.minY + 328.61), controlPoint2: CGPoint(x: frame.minX + 397, y: frame.minY + 331.18))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 440.14, y: frame.minY + 324.32), controlPoint1: CGPoint(x: frame.minX + 419.56, y: frame.minY + 331.18), controlPoint2: CGPoint(x: frame.minX + 430.51, y: frame.minY + 328.61))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 472.98, y: frame.minY + 317), controlPoint1: CGPoint(x: frame.minX + 450.1, y: frame.minY + 319.7), controlPoint2: CGPoint(x: frame.minX + 461.31, y: frame.minY + 317))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 505.83, y: frame.minY + 324.32), controlPoint1: CGPoint(x: frame.minX + 484.73, y: frame.minY + 317), controlPoint2: CGPoint(x: frame.minX + 495.94, y: frame.minY + 319.7))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 537.83, y: frame.minY + 331.18), controlPoint1: CGPoint(x: frame.minX + 515.53, y: frame.minY + 328.61), controlPoint2: CGPoint(x: frame.minX + 526.48, y: frame.minY + 331.18))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 537.83, y: frame.minY + 379))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 421.34, y: frame.minY + 87.32))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 411.18, y: frame.minY + 104.66), controlPoint1: CGPoint(x: frame.minX + 419.82, y: frame.minY + 89.89), controlPoint2: CGPoint(x: frame.minX + 411.18, y: frame.minY + 104.66))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 403.46, y: frame.minY + 108.42), controlPoint1: CGPoint(x: frame.minX + 411.18, y: frame.minY + 104.66), controlPoint2: CGPoint(x: frame.minX + 409.33, y: frame.minY + 108.42))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 373.91, y: frame.minY + 108.42))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 357.02, y: frame.minY + 58.29))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 360.65, y: frame.minY + 57.63), controlPoint1: CGPoint(x: frame.minX + 358.34, y: frame.minY + 58.03), controlPoint2: CGPoint(x: frame.minX + 359.73, y: frame.minY + 57.77))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 382.68, y: frame.minY + 59.74), controlPoint1: CGPoint(x: frame.minX + 371.21, y: frame.minY + 55.72), controlPoint2: CGPoint(x: frame.minX + 374.83, y: frame.minY + 55.72))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 418.63, y: frame.minY + 78.41), controlPoint1: CGPoint(x: frame.minX + 382.68, y: frame.minY + 59.74), controlPoint2: CGPoint(x: frame.minX + 416.32, y: frame.minY + 77.09))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 421.34, y: frame.minY + 87.32), controlPoint1: CGPoint(x: frame.minX + 421.47, y: frame.minY + 79.8), controlPoint2: CGPoint(x: frame.minX + 423.25, y: frame.minY + 83.95))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 340.53, y: frame.minY + 61.53))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 356.43, y: frame.minY + 108.42))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 238.89, y: frame.minY + 108.42))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 233.61, y: frame.minY + 102.88), controlPoint1: CGPoint(x: frame.minX + 236.31, y: frame.minY + 108.42), controlPoint2: CGPoint(x: frame.minX + 233.61, y: frame.minY + 106.91))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 233.61, y: frame.minY + 96.55))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 238.16, y: frame.minY + 89.49), controlPoint1: CGPoint(x: frame.minX + 233.61, y: frame.minY + 93.12), controlPoint2: CGPoint(x: frame.minX + 235.06, y: frame.minY + 91.01))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 275.89, y: frame.minY + 75.97), controlPoint1: CGPoint(x: frame.minX + 241.72, y: frame.minY + 87.84), controlPoint2: CGPoint(x: frame.minX + 263.03, y: frame.minY + 79.34))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 340.53, y: frame.minY + 61.53), controlPoint1: CGPoint(x: frame.minX + 299.11, y: frame.minY + 70.17), controlPoint2: CGPoint(x: frame.minX + 323.45, y: frame.minY + 64.89))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 236.31, y: frame.minY + 244.7))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 255.38, y: frame.minY + 193.32))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 387.43, y: frame.minY + 193.32))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 406.5, y: frame.minY + 244.5))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 236.31, y: frame.minY + 244.7))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 554.84, y: frame.minY + 244.24))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 421.73, y: frame.minY + 244.37))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 402.54, y: frame.minY + 192.92))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 463.35, y: frame.minY + 181.11), controlPoint1: CGPoint(x: frame.minX + 417.84, y: frame.minY + 190.48), controlPoint2: CGPoint(x: frame.minX + 446.73, y: frame.minY + 185.86))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 479.98, y: frame.minY + 167.53), controlPoint1: CGPoint(x: frame.minX + 470.54, y: frame.minY + 179.27), controlPoint2: CGPoint(x: frame.minX + 477.87, y: frame.minY + 171.81))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 519.62, y: frame.minY + 107.11))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 519.62, y: frame.minY + 182.76))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 532.28, y: frame.minY + 182.76), controlPoint1: CGPoint(x: frame.minX + 519.62, y: frame.minY + 191.27), controlPoint2: CGPoint(x: frame.minX + 532.28, y: frame.minY + 191.27))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 532.28, y: frame.minY + 104.66))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 537.69, y: frame.minY + 104.66))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 537.69, y: frame.minY + 81.91), controlPoint1: CGPoint(x: frame.minX + 552.86, y: frame.minY + 104.66), controlPoint2: CGPoint(x: frame.minX + 552.86, y: frame.minY + 81.91))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 532.28, y: frame.minY + 81.91))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 532.28, y: frame.minY + 6.38))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 519.62, y: frame.minY + 6.38), controlPoint1: CGPoint(x: frame.minX + 532.28, y: frame.minY - 2.13), controlPoint2: CGPoint(x: frame.minX + 519.62, y: frame.minY - 2.13))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 519.62, y: frame.minY + 81.91))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 515.93, y: frame.minY + 81.91))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 426.61, y: frame.minY + 67.46), controlPoint1: CGPoint(x: frame.minX + 502.4, y: frame.minY + 80.59), controlPoint2: CGPoint(x: frame.minX + 438.88, y: frame.minY + 73.79))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 389.28, y: frame.minY + 47.48), controlPoint1: CGPoint(x: frame.minX + 414.28, y: frame.minY + 61), controlPoint2: CGPoint(x: frame.minX + 401.35, y: frame.minY + 53.68))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 359.73, y: frame.minY + 44.38), controlPoint1: CGPoint(x: frame.minX + 378.2, y: frame.minY + 41.94), controlPoint2: CGPoint(x: frame.minX + 371.73, y: frame.minY + 42.33))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 274.24, y: frame.minY + 62.98), controlPoint1: CGPoint(x: frame.minX + 352.93, y: frame.minY + 45.7), controlPoint2: CGPoint(x: frame.minX + 312.96, y: frame.minY + 53.15))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 167.38, y: frame.minY + 102.88), controlPoint1: CGPoint(x: frame.minX + 226.42, y: frame.minY + 75.05), controlPoint2: CGPoint(x: frame.minX + 167.38, y: frame.minY + 102.88))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 99.9, y: frame.minY + 103.15))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 71.67, y: frame.minY + 57.04), controlPoint1: CGPoint(x: frame.minX + 84.47, y: frame.minY + 98.66), controlPoint2: CGPoint(x: frame.minX + 78.4, y: frame.minY + 69.77))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 54.66, y: frame.minY + 22.74))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 47.33, y: frame.minY + 18.91), controlPoint1: CGPoint(x: frame.minX + 53.4, y: frame.minY + 19.9), controlPoint2: CGPoint(x: frame.minX + 50.3, y: frame.minY + 19.05))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 4.33, y: frame.minY + 16.34))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 1.23, y: frame.minY + 24.46), controlPoint1: CGPoint(x: frame.minX - 2.14, y: frame.minY + 15.95), controlPoint2: CGPoint(x: frame.minX + 0.3, y: frame.minY + 21.36))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 30.71, y: frame.minY + 140.09))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 64.35, y: frame.minY + 166.67), controlPoint1: CGPoint(x: frame.minX + 33.81, y: frame.minY + 153.01), controlPoint2: CGPoint(x: frame.minX + 51.75, y: frame.minY + 165.35))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 238.03, y: frame.minY + 193.32))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 240.21, y: frame.minY + 193.32))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 221.14, y: frame.minY + 244.7))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 84.6, y: frame.minY + 244.83))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 78.53, y: frame.minY + 249.91), controlPoint1: CGPoint(x: frame.minX + 81.24, y: frame.minY + 244.83), controlPoint2: CGPoint(x: frame.minX + 78.53, y: frame.minY + 246.68))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 78.53, y: frame.minY + 258.62))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 84.6, y: frame.minY + 265.88), controlPoint1: CGPoint(x: frame.minX + 78.53, y: frame.minY + 262.25), controlPoint2: CGPoint(x: frame.minX + 80.71, y: frame.minY + 264.69))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 169.76, y: frame.minY + 288.3), controlPoint1: CGPoint(x: frame.minX + 95.82, y: frame.minY + 269.24), controlPoint2: CGPoint(x: frame.minX + 129.52, y: frame.minY + 278.47))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 173.98, y: frame.minY + 286.85), controlPoint1: CGPoint(x: frame.minX + 171.14, y: frame.minY + 287.77), controlPoint2: CGPoint(x: frame.minX + 172.59, y: frame.minY + 287.51))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 213.95, y: frame.minY + 277.95), controlPoint1: CGPoint(x: frame.minX + 186.71, y: frame.minY + 280.91), controlPoint2: CGPoint(x: frame.minX + 200.17, y: frame.minY + 277.95))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 253.73, y: frame.minY + 286.72), controlPoint1: CGPoint(x: frame.minX + 227.74, y: frame.minY + 277.95), controlPoint2: CGPoint(x: frame.minX + 241.26, y: frame.minY + 280.91))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 278.73, y: frame.minY + 292.13), controlPoint1: CGPoint(x: frame.minX + 261.58, y: frame.minY + 290.35), controlPoint2: CGPoint(x: frame.minX + 270.22, y: frame.minY + 292.13))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 303.46, y: frame.minY + 286.85), controlPoint1: CGPoint(x: frame.minX + 287.24, y: frame.minY + 292.13), controlPoint2: CGPoint(x: frame.minX + 295.61, y: frame.minY + 290.35))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 343.5, y: frame.minY + 277.95), controlPoint1: CGPoint(x: frame.minX + 315.93, y: frame.minY + 281.05), controlPoint2: CGPoint(x: frame.minX + 329.85, y: frame.minY + 277.95))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 383.21, y: frame.minY + 286.72), controlPoint1: CGPoint(x: frame.minX + 357.02, y: frame.minY + 277.95), controlPoint2: CGPoint(x: frame.minX + 370.94, y: frame.minY + 281.05))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 408.21, y: frame.minY + 292.13), controlPoint1: CGPoint(x: frame.minX + 391.19, y: frame.minY + 290.35), controlPoint2: CGPoint(x: frame.minX + 399.83, y: frame.minY + 292.13))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 432.95, y: frame.minY + 286.85), controlPoint1: CGPoint(x: frame.minX + 416.72, y: frame.minY + 292.13), controlPoint2: CGPoint(x: frame.minX + 425.36, y: frame.minY + 290.35))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 472.98, y: frame.minY + 277.95), controlPoint1: CGPoint(x: frame.minX + 445.54, y: frame.minY + 281.05), controlPoint2: CGPoint(x: frame.minX + 459.33, y: frame.minY + 277.95))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 510.78, y: frame.minY + 285.93), controlPoint1: CGPoint(x: frame.minX + 485.91, y: frame.minY + 277.95), controlPoint2: CGPoint(x: frame.minX + 498.91, y: frame.minY + 280.78))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 555.7, y: frame.minY + 266.01), controlPoint1: CGPoint(x: frame.minX + 543.96, y: frame.minY + 274.98), controlPoint2: CGPoint(x: frame.minX + 555.7, y: frame.minY + 266.01))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 559.99, y: frame.minY + 258.36), controlPoint1: CGPoint(x: frame.minX + 558.27, y: frame.minY + 263.9), controlPoint2: CGPoint(x: frame.minX + 559.99, y: frame.minY + 261.72))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 559.99, y: frame.minY + 249.39))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 554.84, y: frame.minY + 244.24), controlPoint1: CGPoint(x: frame.minX + 559.99, y: frame.minY + 246.02), controlPoint2: CGPoint(x: frame.minX + 558.14, y: frame.minY + 244.24))
        bezierPath.close()
        
        bezierPath.lineWidth = CGFloat(lineWidth!)
        
        bezierPath.fit(into: rectToPutImage!).moveCenter(to: rect.center).stroke()
        
        fillColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        bezierPath.fit(into: rectToPutImage!).moveCenter(to: rect.center).fill()
    }
    
    
}

