//
//  RotationViewController.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 10/13/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController, UIGestureRecognizerDelegate, RotationPopoverPresentationControllerDelegate {
    
    
    @IBOutlet weak var rotateButton: UIButton!
    
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
    
    
    // gesture recognizer
    func longPressHandler(_ gestureRecogniser: UILongPressGestureRecognizer) {
        performSegue(withIdentifier: "RotationOptions", sender: self)
    }
    
    
    var rotateDegree: CGFloat = RotationDegree[60]!
    
    var rotateOrientation: Int = RotationOrientation["counterClockwise"]! {
        didSet {
            updateRotateDegree()
        }
    }
    
    private func updateRotateDegree() {
        self.rotateDegree = self.rotateDegree * CGFloat(rotateOrientation)
    }
    
    @IBOutlet weak var objectSelected: UIImageView!
    

    @IBAction func rotateSelectObject(_ sender: UIButton) {
        switch sender.titleLabel!.text! {
        case "Rotate":
            performRotate()
        default:
            break
        }
    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if segue.identifier == "RotationOptions" {
            if let ervc = destination as? EditRotationViewController {
                ervc.delegate = self
                ervc._sliderValue = abs(Int(Float(rotateDegree) / Float.pi * 180))
                if rotateOrientation == 1 {
                    ervc._rotationOrientation = "clockwise"
                } else {
                    ervc._rotationOrientation = "counterClockwise"
                }
                if let ppc = ervc.popoverPresentationController {
                    ppc.sourceRect = CGRect(x: rotateButton.frame.size.width, y: rotateButton.frame.size.height, width: 0, height: 0)
                }
            }
        }
    }
    
    func updateRotationOrientation(_ orientation: String) {
        self.rotateOrientation = RotationOrientation[orientation]!
    }
    
    func updateRotationDegree(_ degree: Int) {
        self.rotateDegree = CGFloat(RotationDegree[degree]!)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
