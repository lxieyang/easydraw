//
//  DrawViewController.swift
//  EasyDraw
//
//  Created by Hanling on 10/16/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIGestureRecognizerDelegate,RotationPopoverPresentationControllerDelegate
    {
    
    @IBOutlet weak var canvas: UIView!
    var selectedObjectID: Int?
    var objects = [UIImageView]()
    
    @IBOutlet weak var rotateButton: UIButton!
    // rotation management
    var rotateDegree: CGFloat = RotationDegree[60]!
    
    var rotateOrientation: Int = RotationOrientation["counterClockwise"]! {
        didSet {
            updateRotateDegree()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        for object in objects{
            self.canvas.addSubview(object)
        }
        
        updateRotateDegree()
        
        // add gesture recognizer
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressHandler(_:)))
        self.rotateButton.addGestureRecognizer(lpgr)
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
    
    // long press gesture recognizer
    func longPressHandler(_ gestureRecogniser: UILongPressGestureRecognizer) {
        performSegue(withIdentifier: "RotationOptions", sender: self)
    }
    
    // implement RotationPopoverPresentationControllerDelegate protocal
    func updateRotationOrientation(_ orientation: String) {
        self.rotateOrientation = RotationOrientation[orientation]!
    }
    
    func updateRotationDegree(_ degree: Int) {
        self.rotateDegree = CGFloat(RotationDegree[degree]!)
    }
    
    
    
    @IBAction func DrawButtonPressed(_ sender: AnyObject) {
        let image : UIImage = UIImage(named:SHAPES[sender.tag])!
        let imageView : UIImageView = UIImageView(image: image)
        let imageWidth = image.size.width / objectOptions.initialShrinkFactor
        let imageHeight = image.size.height / objectOptions.initialShrinkFactor
        imageView.frame = CGRect(origin: CGPoint(x: canvas.bounds.midX - imageWidth / 2, y :canvas.bounds.midY - imageHeight / 2), size: CGSize(width: imageWidth, height: imageHeight))
        objects.append(imageView)
        
        viewDidLoad()
    }


    @IBAction func selectObject(_ sender: AnyObject) {
        if (!objects.isEmpty) {
            selectedObjectID = 0
            highlightObject(object: objects[selectedObjectID!])
        }
    }
    
    @IBAction func selectPrevObject(_ sender: AnyObject) {
        if selectedObjectID != nil {
            removeHighlight(object: objects[selectedObjectID!])
            selectedObjectID = selectedObjectID! == 0 ?
                objects.count - 1 : selectedObjectID! - 1
            highlightObject(object: objects[selectedObjectID!])
        }
    }
    
    @IBAction func selectNextObject(_ sender: AnyObject) {
        if selectedObjectID != nil {
            removeHighlight(object: objects[selectedObjectID!])
            selectedObjectID = selectedObjectID! == objects.count - 1 ?
                0 : selectedObjectID! + 1
            highlightObject(object: objects[selectedObjectID!])
        }
    }
    
    @IBAction func up(_ sender: AnyObject) {
        if let selected = selectedObjectID {
            let currentObject = objects[selected]
            if (currentObject.frame.minY > canvas.bounds.minY) {
                currentObject.center = CGPoint(x: currentObject.center.x, y: currentObject.center.y - Navigation.shiftDistance);
            }
        }
    }
    
    @IBAction func down(_ sender: AnyObject) {
        if let selected = selectedObjectID {
            let currentObject = objects[selected]
            if (currentObject.frame.maxY + Navigation.shiftDistance < canvas.bounds.maxY) {
                currentObject.center = CGPoint(x: currentObject.center.x, y: currentObject.center.y + Navigation.shiftDistance);
            }
        }
    }
    
    @IBAction func left(_ sender: AnyObject) {
        if let selected = selectedObjectID {
            let currentObject = objects[selected]
            if (currentObject.frame.minX > canvas.bounds.minX) {
                currentObject.center = CGPoint(x: currentObject.center.x - Navigation.shiftDistance, y: currentObject.center.y);
            }
        }
    }
    
    @IBAction func right(_ sender: AnyObject) {
        if let selected = selectedObjectID {
            let currentObject = objects[selected]
            if (currentObject.frame.maxX + Navigation.shiftDistance < canvas.bounds.maxX) {
                currentObject.center = CGPoint(x: currentObject.center.x + Navigation.shiftDistance, y: currentObject.center.y);
            }
        }
    }
    
    @IBAction func rotateSelectedObject(_ sender: UIButton) {
        switch sender.titleLabel!.text! {
        case "Rotate":
            if selectedObjectID != nil {
                performRotate()
            }
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func removeHighlight(object: UIImageView!){
        object.layer.borderWidth = 0
        object.layer.borderColor = UIColor.white.cgColor
    }
    
    private func highlightObject(object:UIImageView!){
        object.layer.borderWidth = 2
        object.layer.borderColor = UIColor.blue.cgColor
    }
    
    private func updateRotateDegree() {
        self.rotateDegree = self.rotateDegree * CGFloat(rotateOrientation)
    }
    
    // perform rotation with annimation
    private func performRotate() {
        print ("performing rotation: Rotation orientation: \(rotateOrientation) | Rotation degree: \(rotateDegree)")
        let currentObject = objects[selectedObjectID!]
        UIView.animate(
            withDuration: Animation.RotateDuration,
            animations: {
                currentObject.transform = currentObject.transform.rotated(by: self.rotateDegree)
            },
            completion: { finished in
                
        })
    }
}
