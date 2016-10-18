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
    var timer: Timer?
    
    @IBOutlet weak var rotateButton: UIButton!
    
    // rotation management
    var rotateDegree: CGFloat = RotationDegree[60]!
    
    var rotateOrientation: Int = RotationOrientation["counterClockwise"]! {
        didSet {
            updateRotateDegree()
        }
    }
    
    // navigation control
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        for object in objects{
            self.canvas.addSubview(object)
        }
        
        updateRotateDegree()
        
        // add gesture recognizers
        let lpgr_rotation = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressHandlerForRotation(_:)))
        self.rotateButton.addGestureRecognizer(lpgr_rotation)
        let lpgr_nav_up = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressHandlerForNavUp(_:)))
        self.upButton.addGestureRecognizer(lpgr_nav_up)
        let lpgr_nav_down = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressHandlerForNavDown(_:)))
        self.downButton.addGestureRecognizer(lpgr_nav_down)
        let lpgr_nav_left = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressHandlerForNavLeft(_:)))
        self.leftButton.addGestureRecognizer(lpgr_nav_left)
        let lpgr_nav_right = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressHandlerForNavRight(_:)))
        self.rightButton.addGestureRecognizer(lpgr_nav_right)

    }
    
    // orientation management
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool {
        return true
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
    func longPressHandlerForRotation(_ gestureRecogniser: UILongPressGestureRecognizer) {
        performSegue(withIdentifier: "RotationOptions", sender: self)
    }
    
    func longPressHandlerForNavUp(_ gestureRecogniser: UILongPressGestureRecognizer) {
        if gestureRecogniser.state == .began {
            timer = Timer.scheduledTimer(timeInterval: Navigation.longPressDefaultDuration,
                                         target: self,
                                         selector: #selector(self.up(_:)),
                                         userInfo: nil,
                                         repeats: true)
        } else if gestureRecogniser.state == .ended || gestureRecogniser.state == .cancelled {
            timer?.invalidate()
            timer = nil
        }
    }
    
    func longPressHandlerForNavDown(_ gestureRecogniser: UILongPressGestureRecognizer) {
        if gestureRecogniser.state == .began {
            timer = Timer.scheduledTimer(timeInterval: Navigation.longPressDefaultDuration,
                                         target: self,
                                         selector: #selector(self.down(_:)),
                                         userInfo: nil,
                                         repeats: true)
        } else if gestureRecogniser.state == .ended || gestureRecogniser.state == .cancelled {
            timer?.invalidate()
            timer = nil
        }
    }
    
    func longPressHandlerForNavLeft(_ gestureRecogniser: UILongPressGestureRecognizer) {
        if gestureRecogniser.state == .began {
            timer = Timer.scheduledTimer(timeInterval: Navigation.longPressDefaultDuration,
                                         target: self,
                                         selector: #selector(self.left(_:)),
                                         userInfo: nil,
                                         repeats: true)
        } else if gestureRecogniser.state == .ended || gestureRecogniser.state == .cancelled {
            timer?.invalidate()
            timer = nil
        }
    }
    
    func longPressHandlerForNavRight(_ gestureRecogniser: UILongPressGestureRecognizer) {
        if gestureRecogniser.state == .began {
            timer = Timer.scheduledTimer(timeInterval: Navigation.longPressDefaultDuration,
                                         target: self,
                                         selector: #selector(self.right(_:)),
                                         userInfo: nil,
                                         repeats: true)
        } else if gestureRecogniser.state == .ended || gestureRecogniser.state == .cancelled {
            timer?.invalidate()
            timer = nil
        }
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
            if selectedObjectID != nil {
                removeHighlight(object: objects[selectedObjectID!])
            }
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
    
    @IBAction func deleteSelectedObject(_ sender: AnyObject) {
        if selectedObjectID != nil {
            if (objects.count >= 2) {
                // high light next
                self.selectNextObject(rotateButton)
                // remove the previous one
                let prevObjectID = selectedObjectID! == 0 ? objects.count - 1 : selectedObjectID! - 1
                removeObject(prevObjectID)
            } else if (objects.count == 1) {
                removeHighlight(object: objects[0])
                removeObject(0)
                selectedObjectID = nil
            }
            
            viewWillLayoutSubviews()
        } else {
            let dialog = UIAlertController(
                title: "Alert:",
                message: "Please first select an object to delete!",
                preferredStyle: UIAlertControllerStyle.alert)
            present(
                dialog,
                animated: true,
                completion: {
                    dialog.view.superview?.isUserInteractionEnabled = true
                    dialog.view.superview?.addGestureRecognizer(UITapGestureRecognizer(
                        target: self, action: #selector(self.alertClose(_:))))
            })
        }
    }
    
    func alertClose(_ gesture: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func up(_ sender: AnyObject) {
        if let selected = selectedObjectID {
            let currentObject = objects[selected]
            if (currentObject.frame.minY > canvas.bounds.minY) {
                // currentObject.center = CGPoint(x: currentObject.center.x, y: currentObject.center.y - Navigation.shiftDistance);
                UIView.animate(
                    withDuration: Navigation.shiftDuration,
                    animations: {
                        currentObject.center = CGPoint(x: currentObject.center.x, y: currentObject.center.y - Navigation.shiftDistance);
                    },
                    completion: { finished in
                        
                })
            }
        }
    }
    
    
    @IBAction func down(_ sender: AnyObject) {
        if let selected = selectedObjectID {
            let currentObject = objects[selected]
            if (currentObject.frame.maxY + Navigation.shiftDistance < canvas.bounds.maxY) {
                // currentObject.center = CGPoint(x: currentObject.center.x, y: currentObject.center.y + Navigation.shiftDistance);
                UIView.animate(
                    withDuration: Navigation.shiftDuration,
                    animations: {
                        currentObject.center = CGPoint(x: currentObject.center.x, y: currentObject.center.y + Navigation.shiftDistance);
                    },
                    completion: { finished in
                        
                })
            }
        }
    }
    
    @IBAction func left(_ sender: AnyObject) {
        if let selected = selectedObjectID {
            let currentObject = objects[selected]
            if (currentObject.frame.minX > canvas.bounds.minX) {
                // currentObject.center = CGPoint(x: currentObject.center.x - Navigation.shiftDistance, y: currentObject.center.y);
                UIView.animate(
                    withDuration: Navigation.shiftDuration,
                    animations: {
                        currentObject.center = CGPoint(x: currentObject.center.x - Navigation.shiftDistance, y: currentObject.center.y);
                    },
                    completion: { finished in
                        
                })
            }
        }
    }
    
    @IBAction func right(_ sender: AnyObject) {
        if let selected = selectedObjectID {
            let currentObject = objects[selected]
            if (currentObject.frame.maxX + Navigation.shiftDistance < canvas.bounds.maxX) {
                // currentObject.center = CGPoint(x: currentObject.center.x + Navigation.shiftDistance, y: currentObject.center.y);
                UIView.animate(
                    withDuration: Navigation.shiftDuration,
                    animations: {
                        currentObject.center = CGPoint(x: currentObject.center.x + Navigation.shiftDistance, y: currentObject.center.y);
                    },
                    completion: { finished in
                        
                })
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
    
    private func removeObject(_ index: Int) {
        objects[index].removeFromSuperview()
        objects.remove(at: index)
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
