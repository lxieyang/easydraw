//
//  extensions.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/10/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)
    }
}

func createObjectWithTag(_ tag: Int, _ subTag: Int, _ frame: CGRect) -> UIView {
    switch tag {
    case 0:
        return RectObject(frame: frame)
    case 1:
        return CircleObject(frame: frame)
    case 2:
        return EquicruralTraingleObject(frame: frame)
    case 3:
        return LeftRightTriangle(frame: frame)
    case 4:
        return RightRightTriangle(frame: frame)
    case 5:
        return ArrowBoldObject(frame: frame)
    case 6:
        return TrapezoidMidObject(frame: frame)
    case 7:
        return ParallelogramObject(frame: frame)
    case 8:
        return HexagonObject(frame: frame)
    case 9:
        return CrossFatObject(frame: frame)
    case 10:
        return HeartObject(frame: frame)
    case 11:
        return CloudObject(frame: frame)
    case 12:
        return LightningObject(frame: frame)
    case 13:
        return CameraObject(frame: frame)
    case 14:
        return PhoneObject(frame: frame)
    case 15:
        return VehicleTruckObject(frame: frame)
    case 16:
        switch subTag {
        case 0:
            return PlaneSideObject(frame: frame)
        case 1:
            return PlaneOverObject(frame: frame)
        case 2:
            return PlaneSeaObject(frame: frame)
        default:
            return PlaneSideObject(frame: frame)
        }
    case 17:
        return SunObject(frame: frame)
    default:
        return UIView()
    }
}
