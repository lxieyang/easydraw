//
//  DrawViewController.swift
//  EasyDraw
//
//  Created by Hanling on 10/16/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIGestureRecognizerDelegate,RotationPopoverPresentationControllerDelegate,
    PlaneOptionsPopoverresentationControllerDelegate,
    VehicleOptionsPopoverresentationControllerDelegate
    {
    
    @IBOutlet weak var canvas: UIView!
    var selectedObjectID: Int?
    var objects = [UIView]()
    var timer: Timer?
    
    @IBOutlet weak var rotateButton: UIButton!
    
    // rotation management
    var rotateDegree: CGFloat = RotationDegree[Rotation.defaultRotationDegree]! 
    
    var rotateOrientation: Int = RotationOrientation[Rotation.defaultRotationOrientation]! {
        didSet {
            updateRotateDegree()
        }
    }
    
    // navigation control
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    
    // object button
    @IBOutlet weak var square: UIButton!
    @IBOutlet weak var circle: UIButton!
    @IBOutlet weak var triangle1: UIButton!
    @IBOutlet weak var rightTriangle1: UIButton!
    @IBOutlet weak var rightTriangle2: UIButton!
    @IBOutlet weak var arrow1: UIButton!
    @IBOutlet weak var trapezoid: UIButton!
    @IBOutlet weak var parallelogram: UIButton!
    @IBOutlet weak var hexagon: UIButton!
    @IBOutlet weak var cross: UIButton!
    @IBOutlet weak var heart: UIButton!
    @IBOutlet weak var cloud: UIButton!
    @IBOutlet weak var lightning: UIButton!
    @IBOutlet weak var camera: UIButton!
    @IBOutlet weak var phone: UIButton!
    @IBOutlet weak var vehicle: UIButton!
    @IBOutlet weak var plane: UIButton!
    @IBOutlet weak var sun: UIButton!
    
    
    
    /* plane selector */
    var planeTag: Int? {
        didSet {
            let imageFrame = CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)
            let myimage = UIImage(view: createObjectWithTag(16, planeTag!, imageFrame))
            self.plane.setImage(myimage, for: .normal)
            
            viewWillLayoutSubviews()
        }
    }
    
    /* vehicle selector */
    var vehicleTag: Int? {
        didSet {
            let imageFrame = CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)
            let myimage = UIImage(view: createObjectWithTag(15, vehicleTag!, imageFrame))
            self.vehicle.setImage(myimage, for: .normal)
            
            viewWillLayoutSubviews()
        }
    }
    
    
    
    /* MARK: View Controller Lifecycle */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set button image
        var myimage = UIImage(view: RectObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.square.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: CircleObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.circle.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: EquicruralTraingleObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.triangle1.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: LeftRightTriangle(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.rightTriangle1.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: RightRightTriangle(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.rightTriangle2.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: ArrowBoldObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.arrow1.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: TrapezoidMidObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.trapezoid.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: ParallelogramObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.parallelogram.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: HexagonObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.hexagon.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: CrossFatObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.cross.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: HeartObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.heart.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: CloudObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.cloud.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: LightningObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.lightning.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: CameraObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.camera.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: PhoneObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.phone.setImage(myimage, for: .normal)
        
        vehicleTag = 0
        planeTag = 0
        
        myimage = UIImage(view: SunObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.sun.setImage(myimage, for: .normal)

        
        
        // Do any additional setup after loading the view.
        for object in objects {
            self.canvas.addSubview(object)
        }
        
        canvas.isUserInteractionEnabled = true
        
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
        
        // add longpress for objects
        
        
        var tap_object = UITapGestureRecognizer(target: self, action: #selector(self.singleTapPlane(_:)))
        var long_press_object = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressPlane(_:)))
        self.plane.addGestureRecognizer(tap_object)
        self.plane.addGestureRecognizer(long_press_object)
        
        tap_object = UITapGestureRecognizer(target: self, action: #selector(self.singleTapVehicle(_:)))
        long_press_object = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressVehicle(_:)))
        self.vehicle.addGestureRecognizer(tap_object)
        self.vehicle.addGestureRecognizer(long_press_object)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        } else if segue.identifier == "planeOptions" {
            if let vc = destination as? PlaneObjectDetailViewController {
                vc.delegate = self
                if let ppc = vc.popoverPresentationController {
                    ppc.sourceRect = CGRect(
                        x: plane.frame.size.width,
                        y: plane.frame.size.height,
                        width: 0,
                        height: 0
                    )
                }
            }
        } else if segue.identifier == "vehicleOptions" {
            if let vc = destination as? VehicleObjectDetailViewController {
                vc.delegate = self
                if let ppc = vc.popoverPresentationController {
                    ppc.sourceRect = CGRect(
                        x: vehicle.frame.size.width,
                        y: vehicle.frame.size.height,
                        width: 0,
                        height: 0
                    )
                }
            }
        }

    }
    
    // gesture recognizer for plane
    func singleTapPlane(_ gestureRecogniser: UITapGestureRecognizer) {
        DrawButtonPressed(plane)
    }
    
    func longPressPlane(_ gestureRecogniser: UILongPressGestureRecognizer) {
        performSegue(withIdentifier: "planeOptions", sender: self)
    }
    
    // gesture recognizer for vehicle
    func singleTapVehicle(_ gestureRecogniser: UITapGestureRecognizer) {
        DrawButtonPressed(vehicle)
    }
    
    func longPressVehicle(_ gestureRecogniser: UILongPressGestureRecognizer) {
        performSegue(withIdentifier: "vehicleOptions", sender: self)
    }
    
    
    // long press gesture recognizer
    func longPressHandlerForRotation(_ gestureRecogniser: UILongPressGestureRecognizer) {
        if selectedObjectID != nil {
            performSegue(withIdentifier: "RotationOptions", sender: self)
        } else {
            alertOpen()
        }
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
    
    // implement PlaneOptions PlaneOptionsPopoverresentationControllerDelegate protocal
    func updatePlaneModel(_ model: Int) {
        self.planeTag = model
    }
    
    func updateVehicleTag(_ model: Int) {
        self.vehicleTag = model
    }
    
    
    
    @IBAction func DrawButtonPressed(_ sender: AnyObject) {
        print ("Tag: \(sender.tag)")
        let imageWidth = objectDrawing.initialObjectSize
        let imageHeight = objectDrawing.initialObjectSize
        let originX = canvas.bounds.midX - imageWidth / 2
        let originY = canvas.bounds.midY - imageHeight / 2
        let imageFrame = CGRect(origin: CGPoint(x: originX, y : originY), size: CGSize(width: imageWidth, height: imageHeight))
        
        var subTag = 0
        switch sender.tag {
        case 15:
            subTag = vehicleTag!
            break
        case 16:
            subTag = planeTag!
            break
        default:
            break
        }
        
        let imageView = createObjectWithTag(sender.tag, subTag, imageFrame)
        
        objects.append(imageView)
        self.canvas.addSubview(imageView)
        imageView.setNeedsDisplay()
        
        // reset rotation parameters
        self.rotateDegree = RotationDegree[Rotation.defaultRotationDegree]!
        self.rotateOrientation = RotationOrientation[Rotation.defaultRotationOrientation]!
        
        viewWillLayoutSubviews()
    }

    @IBAction func selectObject(_ sender: AnyObject) {
        if (!objects.isEmpty) {
            if selectedObjectID != nil {
                removeHighlight(object: objects[selectedObjectID!])
            }
            selectedObjectID = 0
            highlightObject(object: objects[selectedObjectID!])
        } else {
            alertOpen()
        }
    }
    
    @IBAction func selectPrevObject(_ sender: AnyObject) {
        if selectedObjectID != nil {
            removeHighlight(object: objects[selectedObjectID!])
            selectedObjectID = selectedObjectID! == 0 ?
                objects.count - 1 : selectedObjectID! - 1
            highlightObject(object: objects[selectedObjectID!])
        } else {
            alertOpen()
        }
    }
    
    @IBAction func selectNextObject(_ sender: AnyObject) {
        if selectedObjectID != nil {
            removeHighlight(object: objects[selectedObjectID!])
            selectedObjectID = selectedObjectID! == objects.count - 1 ?
                0 : selectedObjectID! + 1
            highlightObject(object: objects[selectedObjectID!])
        } else {
            alertOpen()
        }
    }
    
    @IBAction func deselectObject(_ sender: AnyObject) {
        if selectedObjectID != nil {
            removeHighlight(object: objects[selectedObjectID!])
            selectedObjectID = nil
        } else {
            alertOpen()
        }

    }
    
    @IBAction func deleteSelectedObject(_ sender: AnyObject) {
        print ("object Count: \(objects.count)")
        if selectedObjectID != nil {
            if (objects.count >= 2) {
                removeObject(selectedObjectID!)
            } else if (objects.count == 1) {
                removeHighlight(object: objects[0])
                removeObject(0)
            }
            
            viewWillLayoutSubviews()
        } else {
            alertOpen()
        }
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
        } else {
            alertOpen()
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
        } else {
            alertOpen()
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
        } else {
            alertOpen()
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
        } else {
            alertOpen()
        }
    }
    
    @IBAction func rotateSelectedObject(_ sender: UIButton) {
        switch sender.titleLabel!.text! {
        case "Rotate":
            if selectedObjectID != nil {
                performRotate()
            } else {
                alertOpen()
            }
        default:
            break
        }
    }
    
    func alertOpen() {
        let dialog = UIAlertController(
            title: "Please select an object first! 😜",
            message: nil,
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
    
    func alertClose(_ gesture: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func removeHighlight(object: UIView!){
        object.layer.borderWidth = 0
        object.layer.borderColor = UIColor.white.cgColor
    }
    
    private func highlightObject(object:UIView!){
        object.layer.borderWidth = CGFloat(objectDrawing.heighlightWidth)
        object.layer.borderColor = UIColor.blue.cgColor
    }
    
    private func removeObject(_ index: Int) {
        objects[index].removeFromSuperview()
        objects.remove(at: index)
        selectedObjectID = nil
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
