//
//  RotationViewController.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 10/13/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class RotationViewController:
    UIViewController,
    UIGestureRecognizerDelegate,
    RotationPopoverPresentationControllerDelegate {
    
    
    /* MARK: View Controller Lifecycle */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateRotateDegree()
        
        // add gesture recognizer
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressHandler(_:)))
        self.rotateButton.addGestureRecognizer(lpgr)
        print (rotateOrientation)
    }
    
    // long press gesture recognizer
    func longPressHandler(_ gestureRecogniser: UILongPressGestureRecognizer) {
        performSegue(withIdentifier: "RotationOptions", sender: self)
    }

    
    @IBOutlet weak var rotateButton: UIButton!
    
    // rotation management
    var rotateDegree: CGFloat = RotationDegree[60]!
    
    var rotateOrientation: Int = RotationOrientation["counterClockwise"]! {
        didSet {
            updateRotateDegree()
        }
    }
    
    private func updateRotateDegree() {
        self.rotateDegree = self.rotateDegree * CGFloat(rotateOrientation)
    }
    
    
    // outlet of the object
    @IBOutlet weak var objectSelected: UIImageView!
    
    
    // rotate button pressed / tapped
    @IBAction func rotateSelectObject(_ sender: UIButton) {
        switch sender.titleLabel!.text! {
        case "Rotate":
            performRotate()
        default:
            break
        }
    }
    
    // perform rotation with annimation
    private func performRotate() {
        print ("performing rotation: Rotation orientation: \(rotateOrientation) | Rotation degree: \(rotateDegree)")
        UIView.animate(
            withDuration: Animation.RotateDuration,
            animations: {
                self.objectSelected.transform = self.objectSelected.transform.rotated(by: self.rotateDegree)
            },
            completion: { finished in
                
        })
    }
    
    
    // prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if segue.identifier == "RotationOptions" {
            if let ervc = destination as? EditRotationViewController {
                // set the delegate
                ervc.delegate = self
                // prepare the initial data
                ervc._sliderValue = abs(Int(Float(rotateDegree) / Float.pi * 180))
                if rotateOrientation == 1 {
                    ervc._rotationOrientation = "clockwise"
                } else {
                    ervc._rotationOrientation = "counterClockwise"
                }
                // define popover frame
                if let ppc = ervc.popoverPresentationController {
                    // set the source rect to be the frame of the rotate button
                    ppc.sourceRect = CGRect(
                        x: rotateButton.frame.size.width,
                        y: rotateButton.frame.size.height,
                        width: 0,
                        height: 0
                    )
                }
            }
        }
    }
    
    
    // implement RotationPopoverPresentationControllerDelegate protocal
    func updateRotationOrientation(_ orientation: String) {
        self.rotateOrientation = RotationOrientation[orientation]!
    }
    
    func updateRotationDegree(_ degree: Int) {
        self.rotateDegree = CGFloat(RotationDegree[degree]!)
    }
}
