//
//  DrawViewController.swift
//  EasyDraw
//
//  Created by Hanling on 10/16/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class MyView: UIView {
    var id: Int = 0
    var scalingFactor: CGFloat = 1.0
}

class MyImageView: UIImageView{
    var id: Int = 0
    var scalingFactor: CGFloat = 1.0
}

class MyTextField: UITextField{
    var id: Int = 0
    var scalingFactor: CGFloat = 1.0
}

@available(iOS 10.0, *)
class ViewController: UIViewController,
    UIGestureRecognizerDelegate,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate,
    RotationPopoverPresentationControllerDelegate,
    PlaneOptionsPopoverresentationControllerDelegate,
    VehicleOptionsPopoverresentationControllerDelegate,
    CrossOptionsPopoverresentationControllerDelegate,
    ArrowOptionsPopoverresentationControllerDelegate
    {
    
    @IBOutlet weak var canvas: UIView!
    var selectedObjectID: Int?
    
    var objectIDCounter = 0
    var indexes = [Int]()
    var currentIndex = 0
    var objects = [Int: UIView]()
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
    
    // save and load
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var loadButton: UIButton!
    
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
    
    /* cross selector */
    var crossTag: Int? {
        didSet {
            let imageFrame = CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)
            let myimage = UIImage(view: createObjectWithTag(9, crossTag!, imageFrame))
            self.cross.setImage(myimage, for: .normal)
            
            viewWillLayoutSubviews()
        }
    }
    
    /* arrow selector */
    var arrowTag: Int? {
        didSet {
            let imageFrame = CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)
            let myimage = UIImage(view: createObjectWithTag(5, arrowTag!, imageFrame))
            self.arrow1.setImage(myimage, for: .normal)
            
            viewWillLayoutSubviews()
        }
    }
    
    
    /* MARK: View Controller Lifecycle */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add shadow to long-pressable buttons
        showLongPressable(self.rotateButton)
        showLongPressable(self.arrow1)
        showLongPressable(self.cross)
        showLongPressable(self.vehicle)
        showLongPressable(self.plane)
        showLongPressable(self.upButton)
        showLongPressable(self.downButton)
        showLongPressable(self.leftButton)
        showLongPressable(self.rightButton)
        
        
        
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
        
        arrowTag = 0
        
        myimage = UIImage(view: TrapezoidMidObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.trapezoid.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: ParallelogramObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.parallelogram.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: HexagonObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.hexagon.setImage(myimage, for: .normal)
        
        crossTag = 0
        
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

        
        
        // load default saved project on last exit if there exists one
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        var savedDiagrams : [SavedDiagram] = []
        
        do{
            
            savedDiagrams = try context.fetch(SavedDiagram.fetchRequest())
            
            print("load diagram info from core data")
            
        }
            
        catch {
            
            print("Fetching failed!")
            
        }
        
        for savedDiagram in savedDiagrams {
            
            if (savedDiagram.title == "DEFAULT_SAVE_ON_EXIT") {
                
                var savedObjectFileNames : [String] = [String]()
                
                if let loadedObjectFileNames = NSKeyedUnarchiver.unarchiveObject(withFile: savedDiagram.objectArrayFile!) as? [String] {
                    
                    savedObjectFileNames = loadedObjectFileNames
                    
                }
                
                
                
                loadedObjects = [UIView]()
                
                for filename in savedObjectFileNames {
                    
                    var savedObject : UIView = UIView()
                    
                    if let loadedObject = NSKeyedUnarchiver.unarchiveObject(withFile: filename) as? UIView {
                        
                        savedObject = loadedObject
                        
                    }
                    
                    loadedObjects.append(savedObject)
                    
                }
                
                load(isDefaultLoad: true)
                
                break
                
            }
            
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
        
        tap_object = UITapGestureRecognizer(target: self, action: #selector(self.singleTapCross(_:)))
        long_press_object = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressCross(_:)))
        self.cross.addGestureRecognizer(tap_object)
        self.cross.addGestureRecognizer(long_press_object)
        
        tap_object = UITapGestureRecognizer(target: self, action: #selector(self.singleTapArrow(_:)))
        long_press_object = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressArrow(_:)))
        self.arrow1.addGestureRecognizer(tap_object)
        self.arrow1.addGestureRecognizer(long_press_object)
        
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: Notification.Name.UIApplicationWillResignActive, object: nil)

    }
    
    func showLongPressable(_ toMakeShadow: UIButton) {
        toMakeShadow.layer.shadowColor = UIColor.gray.cgColor
        toMakeShadow.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        toMakeShadow.layer.shadowOpacity = 1.0
        toMakeShadow.layer.shadowRadius = 0.0
        toMakeShadow.layer.masksToBounds = false
        toMakeShadow.layer.cornerRadius = 5.0
    }
    
    // whenever the HOME button is pressed once or twice
    // save the current whole project
    func appMovedToBackground() {
        
        let saveVC = saveDiagramViewController()
        
        saveVC.objects = objects
        
        saveVC.thumbnailCanvas = convertCurrentCanvasToUIImage()
        
        saveVC.save(isDefaultSave: true)
        
        print("App moved to background!")
        
    }
    
    var loadedObjects : [UIView] = [UIView]()
    @IBAction func loadDiagram(segue: UIStoryboardSegue) {
        load(isDefaultLoad: false)
    }
    
    func load(isDefaultLoad: Bool) {
        
        for id in objects.keys{
            
            objects[id]!.removeFromSuperview()
            
        }
        
        objects.removeAll()
        
        indexes.removeAll()
        
        selectedObjectID = nil
        
        objectIDCounter = 0
        
        
        for object in loadedObjects {
            
            self.indexes.append(objectIDCounter)
            
            // cast UIView to MyView
            
            // otherwise there will be problem with selection
            
            if (object is MyView) {
                
                var objectToBeLoaded : MyView
                
                objectToBeLoaded = object as! MyView
                
                objectToBeLoaded.id = objectIDCounter
                
                self.objects[objectIDCounter] = objectToBeLoaded
                
                // add tap gesture recognizer
                
                let selectGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.selectGestureAction(_:)))
                
                objectToBeLoaded.addGestureRecognizer(selectGestureRecognizer)
                
                objectIDCounter += 1
                
                self.canvas.addSubview(objectToBeLoaded)
                
                objectToBeLoaded.setNeedsDisplay()
                
            }
                
            else if (object is MyImageView) {
                
                // cast UIView to MyImageView when loading an image imported from photo library
                
                var myImageViewObject : MyImageView
                
                myImageViewObject = object as! MyImageView
                
                myImageViewObject.id = objectIDCounter
                
                self.objects[objectIDCounter] = myImageViewObject
                
                let selectGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.selectGestureAction(_:)))
                
                myImageViewObject.addGestureRecognizer(selectGestureRecognizer)
                
                objectIDCounter += 1
                
                self.canvas.addSubview(myImageViewObject)
                
                myImageViewObject.setNeedsDisplay()
                
            }
            else if (object is MyTextField) {
                var myTextFieldObject : MyTextField
                
                myTextFieldObject = object as! MyTextField
                
                myTextFieldObject.id = objectIDCounter
                
                self.objects[objectIDCounter] = myTextFieldObject
                
                let selectGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.selectGestureAction(_:)))
                
                myTextFieldObject.addGestureRecognizer(selectGestureRecognizer)
                
                objectIDCounter += 1
                
                self.canvas.addSubview(myTextFieldObject)
                
                myTextFieldObject.setNeedsDisplay()
            }
            
        }
        
        currentIndex = 0
        
        loadedObjects.removeAll()
        
        // reset rotation parameters
        
        self.rotateDegree = RotationDegree[Rotation.defaultRotationDegree]!
        
        self.rotateOrientation = RotationOrientation[Rotation.defaultRotationOrientation]!
        
        viewWillLayoutSubviews()
        
        
        
        if (!isDefaultLoad) {
            
            let ac = UIAlertController(title: "Loaded!", message: "Your free body diagram has been loaded.", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            
            present(ac, animated: true)
            
        }
        
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
        } else if segue.identifier == "crossOptions" {
            if let vc = destination as? CrossObjectDetailViewController {
                vc.delegate = self
                if let ppc = vc.popoverPresentationController {
                    ppc.sourceRect = CGRect(
                        x: cross.frame.size.width,
                        y: cross.frame.size.height,
                        width: 0,
                        height: 0
                    )
                }
            }
        } else if segue.identifier == "arrowOptions" {
            if let vc = destination as? ArrowObjectDetailViewController {
                vc.delegate = self
                if let ppc = vc.popoverPresentationController {
                    ppc.sourceRect = CGRect(
                        x: arrow1.frame.size.width,
                        y: arrow1.frame.size.height,
                        width: 0,
                        height: 0
                    )
                }
            }
        } else if segue.identifier == "saveDiagramSegue" {
            if let svc = destination as? saveDiagramViewController {
                svc.objects = self.objects
                svc.thumbnailCanvas = convertCurrentCanvasToUIImage()
                // define popover frame
                if let ppc = svc.popoverPresentationController {
                    // set the source rect to be the frame of the rotate button
                    ppc.sourceRect = CGRect(
                        x: saveButton.frame.size.width,
                        y: saveButton.frame.size.height,
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
    
    // gesture recognizer for cross
    func singleTapCross(_ gestureRecogniser: UITapGestureRecognizer) {
        DrawButtonPressed(cross)
    }
    
    func longPressCross(_ gestureRecogniser: UILongPressGestureRecognizer) {
        performSegue(withIdentifier: "crossOptions", sender: self)
    }
    
    // gesture recognizer for arrow
    func singleTapArrow(_ gestureRecogniser: UITapGestureRecognizer) {
        DrawButtonPressed(arrow1)
    }
    
    func longPressArrow(_ gestureRecogniser: UILongPressGestureRecognizer) {
        performSegue(withIdentifier: "arrowOptions", sender: self)
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
    
    // implement PlaneOptionsPopoverresentationControllerDelegate protocal
    func updatePlaneModel(_ model: Int) {
        self.planeTag = model
    }
    
    // implement VehicleOptionsPopoverresentationControllerDelegate protocal
    func updateVehicleTag(_ model: Int) {
        self.vehicleTag = model
    }
    
    // implement CrossOptionsPopoverresentationControllerDelegate protocal
    func updateCrossTag(_ model: Int) {
        self.crossTag = model
    }
    
    // implement ArrowOptionsPopoverresentationControllerDelegate protocal
    func updateArrowTag(_ model: Int) {
        self.arrowTag = model
    }

    
    // import image from photo library
    @IBAction func importFromPhotoLibrary(_ sender: AnyObject) {
       
        let image = UIImagePickerController()
        image.allowsEditing = true
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(image, animated: true)
    }
    
    func resizeImage(image: UIImage, newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    // method for when the user selected a picture using the image picker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        
        dismiss(animated: true)
        
        let originalSize = image.size
        
        let imageWidth = objectDrawing.initialObjectSize
        let imageHeight = objectDrawing.initialObjectSize
        
        let widthRatio = imageWidth / originalSize.width
        let heightRatio = imageHeight / originalSize.height
        
        var newSize : CGSize
        
        if widthRatio > heightRatio {
            newSize = CGSize(width: originalSize.width * heightRatio, height: originalSize.height * heightRatio)
        } else {
            newSize = CGSize(width: originalSize.width * widthRatio, height: originalSize.height * widthRatio)
        }
        
        let originX = canvas.bounds.midX - imageWidth / 2
        let originY = canvas.bounds.midY - imageHeight / 2
        let imageFrame = CGRect(origin: CGPoint(x: originX, y : originY), size: CGSize(width: imageWidth, height: imageHeight))
        let imageView = MyImageView(frame: imageFrame)
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.clipsToBounds = true
        let newImage = resizeImage(image: image, newSize: newSize)
        
        imageView.image = newImage
        imageView.isUserInteractionEnabled = true
        imageView.id = objectIDCounter
        
        let selectGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.selectGestureAction(_:)))
        imageView.addGestureRecognizer(selectGestureRecognizer)
        
        
        objects[objectIDCounter] = imageView
        self.canvas.addSubview(imageView)
         indexes.append(objectIDCounter)
        objectIDCounter += 1
        // the image imported will be at the bottom
        self.canvas.sendSubview(toBack: imageView)
        
        // reset rotation parameters
        self.rotateDegree = RotationDegree[Rotation.defaultRotationDegree]!
        self.rotateOrientation = RotationOrientation[Rotation.defaultRotationOrientation]!
        
        viewWillLayoutSubviews()
    }
    
    func selectGestureAction(_ sender: UITapGestureRecognizer){
        
        if let object = sender.view as? MyView {
            highlightObject(object: object)
            select(objectID: object.id)
        } else if let object = sender.view as? MyImageView {
            highlightObject(object: object)
            select(objectID: object.id)
        } else if let object = sender.view as? MyTextField {
            highlightObject(object: object)
            select(objectID: object.id)
        }
    }
    
    func convertCurrentCanvasToUIImage() -> UIImage {
        
        // first need to deselect if any object gets selected
        
        if selectedObjectID != nil {
            
            removeHighlight(object: objects[selectedObjectID!])
            
        }
        
        
        
        // convert UIView to a UIImage
        
        UIGraphicsBeginImageContextWithOptions(canvas.bounds.size, true, 0)
        
        canvas.drawHierarchy(in: canvas.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        
        
        
        
        // reselect the object
        
        if selectedObjectID != nil {
            
            highlightObject(object: objects[selectedObjectID!])
            
        }
        
        return image!
        
    }
    
    
    
    // export to photo library
    
    @IBAction func exportToPhotoLibrary(_ sender: AnyObject) {
        
        let image = convertCurrentCanvasToUIImage()
        
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(exportStatus(_:didFinishSavingWithError:contextInfo:)), nil)
        
    }
    
    // tells the user if the diagram has been exported successfully
    func exportStatus(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your free body diagram has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    
    @IBAction func TextButtonPressed(_ sender: Any) {
        let fieldWidth = objectDrawing.initialObjectSize
        let fieldHeight = objectDrawing.initialObjectSize
        let originX = canvas.bounds.midX - fieldWidth / 2
        let originY = canvas.bounds.midY - fieldHeight / 2
        let imageFrame = CGRect(origin: CGPoint(x: originX, y : originY), size: CGSize(width: fieldWidth, height: fieldHeight))

        let textField = MyTextField(frame: imageFrame)
        textField.backgroundColor = UIColor.white.withAlphaComponent(0.3) // UIColor.white
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 30)


        textField.id = objectIDCounter

        let selectGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.selectGestureAction(_:)))
        textField.addGestureRecognizer(selectGestureRecognizer)

        objects[objectIDCounter] = textField
        //        // the image imported will be at the bottom
        self.canvas.sendSubview(toBack: textField)
        indexes.append(objectIDCounter)
        objectIDCounter += 1
        //
        self.canvas.addSubview(textField)
        textField.setNeedsDisplay()
        
        //        // reset rotation parameters
        self.rotateDegree = RotationDegree[Rotation.defaultRotationDegree]!
        self.rotateOrientation = RotationOrientation[Rotation.defaultRotationOrientation]!
        //
        viewWillLayoutSubviews()
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
        case 5:
            subTag = arrowTag!
            break
        case 9:
            subTag = crossTag!
            break
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
        
        imageView.isUserInteractionEnabled = true
        imageView.id = objectIDCounter
        
        let selectGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.selectGestureAction(_:)))
        imageView.addGestureRecognizer(selectGestureRecognizer)
        
        objects[objectIDCounter] = imageView
        // the image imported will be at the bottom
        self.canvas.sendSubview(toBack: imageView)
        indexes.append(objectIDCounter)
        objectIDCounter += 1

        self.canvas.addSubview(imageView)
        imageView.setNeedsDisplay()
        
        // reset rotation parameters
        self.rotateDegree = RotationDegree[Rotation.defaultRotationDegree]!
        self.rotateOrientation = RotationOrientation[Rotation.defaultRotationOrientation]!
        
        viewWillLayoutSubviews()
    }
    
    func select(objectID: Int?){
        if (!objects.isEmpty) {
            if (selectedObjectID != nil){
                removeHighlight(object: objects[selectedObjectID!])
            }
            
            selectedObjectID = objectID
            highlightObject(object: objects[selectedObjectID!])
            
        } else {
            alertOpen()
        }
    }

    @IBAction func selectObject(_ sender: AnyObject) {
        if selectedObjectID == nil {
            let objectID = objects.keys.first
            select(objectID: objectID)
        } else {
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
    }
    
    @IBAction func selectPrevObject(_ sender: AnyObject) {
        if selectedObjectID != nil {
            removeHighlight(object: objects[selectedObjectID!])
            
            if (currentIndex == 0){
                currentIndex = indexes.count - 1
            } else {
                currentIndex = currentIndex - 1
            }
            
            selectedObjectID = indexes[currentIndex]
            highlightObject(object: objects[selectedObjectID!])
        } else {
            alertOpen()
        }
    }
    
    @IBAction func selectNextObject(_ sender: AnyObject) {
        if selectedObjectID != nil {
            
            removeHighlight(object: objects[selectedObjectID!])
            
            if (currentIndex == indexes.count - 1){
                currentIndex = 0
            } else {
                currentIndex = currentIndex + 1
            }
            
            selectedObjectID = indexes[currentIndex]
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
    
    func deleteObject(){
        if selectedObjectID != nil {
            if (objects.count >= 2) {
                removeObject(selectedObjectID!)
                
            } else if (objects.count == 1) {
                removeHighlight(object: objects[objects.keys.first!])
                removeObject(objects.keys.first!)
                
            }
            
            viewWillLayoutSubviews()
        } else {
            alertOpen()
        }
    }
    
    @IBAction func deleteSelectedObject(_ sender: AnyObject) {
        deleteObject()
    }
    
    @IBAction func clearAll(_ sender: Any) {
        
        for id in objects.keys{
            objects[id]!.removeFromSuperview()
        }
        
        objects.removeAll()
        indexes.removeAll()
        selectedObjectID = nil
    }


    @IBAction func widthIncrease(_ sender: UIButton) {
        let canvasWidth = self.canvas.frame.width
        let maxWidthFactor = canvasWidth / objectDrawing.initialObjectSize
        let maxScalingFactor = Double(maxWidthFactor) * 0.9
        let minScalingFactor = Double(0.3)

        let scale = objectDrawing.scalingIncreaseFactor

        if let selected = selectedObjectID {
            // let currentObject = objects[selected]!
            if let currentObject = objects[selected]! as? MyView {
                let scalingFactor = currentObject.scalingFactor * scale
                if Double(scalingFactor) >= minScalingFactor && Double(scalingFactor) <= maxScalingFactor {
                    UIView.animate(
                        withDuration: objectDrawing.scalingDuration,
                        animations: {

                                // currentObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                                currentObject.transform = currentObject.transform.scaledBy(x: scale, y: 1)

                                currentObject.scalingFactor = scalingFactor     // put here for smooth effect


                    },
                        completion: { finished in
                            //currentObject.scalingFactor = scalingFactor
                    })
                }
            } else if let currentObject = objects[selected]! as? MyImageView {
                let scalingFactor = currentObject.scalingFactor * scale
                if Double(scalingFactor) >= minScalingFactor && Double(scalingFactor) <= maxScalingFactor {
                    UIView.animate(
                        withDuration: objectDrawing.scalingDuration,
                        animations: {

                                // currentObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                                currentObject.transform = currentObject.transform.scaledBy(x: scale, y: 1)

                                currentObject.scalingFactor = scalingFactor     // put here for smooth effect
                    },
                        completion: { finished in
                            // currentObject.scalingFactor = scalingFactor
                    })
                }
            } else if let currentObject = objects[selected]! as? MyTextField {
                let scalingFactor = currentObject.scalingFactor * scale
                if Double(scalingFactor) >= minScalingFactor && Double(scalingFactor) <= maxScalingFactor {
                    UIView.animate(
                        withDuration: objectDrawing.scalingDuration,
                        animations: {
                            // currentObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                            currentObject.transform = currentObject.transform.scaledBy(x: scale, y: 1)
                            currentObject.scalingFactor = scalingFactor     // put here for smooth effect

                    },
                        completion: { finished in
                            // currentObject.scalingFactor = scalingFactor
                    })
                }
            }
        } else {
            alertOpen()
        }

    }

    @IBAction func widthDecrease(_ sender: UIButton) {
                let canvasWidth = self.canvas.frame.width
                let maxWidthFactor = canvasWidth / objectDrawing.initialObjectSize
                let maxScalingFactor = Double(maxWidthFactor) * 0.9
                let minScalingFactor = Double(0.3)
        
                let scale = objectDrawing.scalingDecreaseFactor
        
                if let selected = selectedObjectID {
                    // let currentObject = objects[selected]!
                    if let currentObject = objects[selected]! as? MyView {
                        let scalingFactor = currentObject.scalingFactor * scale
                        if Double(scalingFactor) >= minScalingFactor && Double(scalingFactor) <= maxScalingFactor {
                            UIView.animate(
                                withDuration: objectDrawing.scalingDuration,
                                animations: {
                                   //
                                        // currentObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                                        currentObject.transform = currentObject.transform.scaledBy(x: scale, y: 1)
        
                                        currentObject.scalingFactor = scalingFactor     // put here for smooth effect
        

                            },
                                completion: { finished in
                                    //currentObject.scalingFactor = scalingFactor
                            })
                        }
                    } else if let currentObject = objects[selected]! as? MyImageView {
                let scalingFactor = currentObject.scalingFactor * scale
                if Double(scalingFactor) >= minScalingFactor && Double(scalingFactor) <= maxScalingFactor {
                    UIView.animate(
                        withDuration: objectDrawing.scalingDuration,
                        animations: {
        
                            // currentObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                            currentObject.transform = currentObject.transform.scaledBy(x: scale, y: 1)
        
                            currentObject.scalingFactor = scalingFactor     // put here for smooth effect
                    },
                        completion: { finished in
                            // currentObject.scalingFactor = scalingFactor
                    })
                }
            } else if let currentObject = objects[selected]! as? MyTextField {
                let scalingFactor = currentObject.scalingFactor * scale
                if Double(scalingFactor) >= minScalingFactor && Double(scalingFactor) <= maxScalingFactor {
                    UIView.animate(
                        withDuration: objectDrawing.scalingDuration,
                        animations: {
                            // currentObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                            currentObject.transform = currentObject.transform.scaledBy(x: scale, y: 1)
                            currentObject.scalingFactor = scalingFactor     // put here for smooth effect
        
                    },
                        completion: { finished in
                            // currentObject.scalingFactor = scalingFactor
                    })
                }
            }
                } else {
                    alertOpen()
                }

    }
    

    @IBAction func heightDecrease(_ sender: UIButton) {
                let canvasHeight = self.canvas.frame.height
                let maxHeightFactor = canvasHeight / objectDrawing.initialObjectSize
                let maxScalingFactor = Double(maxHeightFactor) * 0.9
                let minScalingFactor = Double(0.3)
        
                let scale =  objectDrawing.scalingDecreaseFactor
        
                if let selected = selectedObjectID {
                    // let currentObject = objects[selected]!
                    if let currentObject = objects[selected]! as? MyView {
                        let scalingFactor = currentObject.scalingFactor * scale
                        if Double(scalingFactor) >= minScalingFactor && Double(scalingFactor) <= maxScalingFactor {
                            UIView.animate(
                                withDuration: objectDrawing.scalingDuration,
                                animations: {
        
                                    // currentObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                                    currentObject.transform = currentObject.transform.scaledBy(x: 1, y: scale)
        
                                    currentObject.scalingFactor = scalingFactor     // put here for smooth effect
                            },
                                completion: { finished in
                                    //currentObject.scalingFactor = scalingFactor
                            })
                        }
                    } else if let currentObject = objects[selected]! as? MyImageView {
                        let scalingFactor = currentObject.scalingFactor * scale
                        if Double(scalingFactor) >= minScalingFactor && Double(scalingFactor) <= maxScalingFactor {
                            UIView.animate(
                                withDuration: objectDrawing.scalingDuration,
                                animations: {
        
                                    // currentObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                                    currentObject.transform = currentObject.transform.scaledBy(x: 1, y: scale)
        
                                    currentObject.scalingFactor = scalingFactor     // put here for smooth effect
                            },
                                completion: { finished in
                                    // currentObject.scalingFactor = scalingFactor
                            })
                        }
                    } else if let currentObject = objects[selected]! as? MyTextField {
                        let scalingFactor = currentObject.scalingFactor * scale
                        if Double(scalingFactor) >= minScalingFactor && Double(scalingFactor) <= maxScalingFactor {
                            UIView.animate(
                                withDuration: objectDrawing.scalingDuration,
                                animations: {
                                    // currentObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                                    currentObject.transform = currentObject.transform.scaledBy(x: 1, y: scale)
                                    currentObject.scalingFactor = scalingFactor     // put here for smooth effect
        
                            },
                                completion: { finished in
                                    // currentObject.scalingFactor = scalingFactor
                            })
                        }
                    }
                } else {
                    alertOpen()
                }

    }

    @IBAction func heightIncrease(_ sender: UIButton) {
        let canvasHeight = self.canvas.frame.height
        let maxHeightFactor = canvasHeight / objectDrawing.initialObjectSize
        let maxScalingFactor = Double(maxHeightFactor) * 0.9
        let minScalingFactor = Double(0.3)

        let scale = objectDrawing.scalingIncreaseFactor

        if let selected = selectedObjectID {
            // let currentObject = objects[selected]!
            if let currentObject = objects[selected]! as? MyView {
                let scalingFactor = currentObject.scalingFactor * scale
                if Double(scalingFactor) >= minScalingFactor && Double(scalingFactor) <= maxScalingFactor {
                    UIView.animate(
                        withDuration: objectDrawing.scalingDuration,
                        animations: {

                                // currentObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                                currentObject.transform = currentObject.transform.scaledBy(x: 1, y: scale)

                                currentObject.scalingFactor = scalingFactor     // put here for smooth effect
                    },
                        completion: { finished in
                            //currentObject.scalingFactor = scalingFactor
                    })
                }
            } else if let currentObject = objects[selected]! as? MyImageView {
                let scalingFactor = currentObject.scalingFactor * scale
                if Double(scalingFactor) >= minScalingFactor && Double(scalingFactor) <= maxScalingFactor {
                    UIView.animate(
                        withDuration: objectDrawing.scalingDuration,
                        animations: {

                            // currentObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                            currentObject.transform = currentObject.transform.scaledBy(x: 1, y: scale)

                            currentObject.scalingFactor = scalingFactor     // put here for smooth effect
                    },
                        completion: { finished in
                            // currentObject.scalingFactor = scalingFactor
                    })
                }
            } else if let currentObject = objects[selected]! as? MyTextField {
                let scalingFactor = currentObject.scalingFactor * scale
                if Double(scalingFactor) >= minScalingFactor && Double(scalingFactor) <= maxScalingFactor {
                    UIView.animate(
                        withDuration: objectDrawing.scalingDuration,
                        animations: {
                            // currentObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                            currentObject.transform = currentObject.transform.scaledBy(x: 1, y: scale)
                            currentObject.scalingFactor = scalingFactor     // put here for smooth effect

                    },
                        completion: { finished in
                            // currentObject.scalingFactor = scalingFactor
                    })
                }
            }
        } else {
            alertOpen()
        }

    }

    

    @IBAction func scaleIncrease(_ sender: UIButton) {
        let canvasWidth = self.canvas.frame.width
        let canvasHeight = self.canvas.frame.height
        let maxWidthFactor = canvasWidth / objectDrawing.initialObjectSize
        let maxHeightFactor = canvasHeight / objectDrawing.initialObjectSize
        let maxScalingFactor = Double(min(maxWidthFactor, maxHeightFactor) * 0.9)
        let minScalingFactor = Double(0.3)
        
        let scale = sender.tag == 0 ? objectDrawing.scalingIncreaseFactor : objectDrawing.scalingDecreaseFactor
        
        if let selected = selectedObjectID {
            // let currentObject = objects[selected]!
            if let currentObject = objects[selected]! as? MyView {
                let scalingFactor = currentObject.scalingFactor * scale
                if Double(scalingFactor) >= minScalingFactor && Double(scalingFactor) <= maxScalingFactor {
                    UIView.animate(
                        withDuration: objectDrawing.scalingDuration,
                        animations: {
                            let tempObject = currentObject
                            
                            // tempObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                            tempObject.transform = currentObject.transform.scaledBy(x: scale, y: scale)
                            
                            if (tempObject.frame.minX > self.canvas.bounds.minX && tempObject.frame.maxX < self.canvas.bounds.maxX && tempObject.frame.minY > self.canvas.bounds.minY && tempObject.frame.maxY < self.canvas.bounds.maxY) {
                                
                                // currentObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                                currentObject.transform = currentObject.transform.scaledBy(x: scale, y: scale)
                                
                                currentObject.scalingFactor = scalingFactor     // put here for smooth effect
                                
                            }
                    },
                        completion: { finished in
                            //currentObject.scalingFactor = scalingFactor
                    })
                }
            } else if let currentObject = objects[selected]! as? MyImageView {
                let scalingFactor = currentObject.scalingFactor * scale
                if Double(scalingFactor) >= minScalingFactor && Double(scalingFactor) <= maxScalingFactor {
                    UIView.animate(
                        withDuration: objectDrawing.scalingDuration,
                        animations: {
                            let tempObject = currentObject
                            
                            // tempObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                            tempObject.transform = currentObject.transform.scaledBy(x: scale, y: scale)
                            
                            if (tempObject.frame.minX > self.canvas.bounds.minX && tempObject.frame.maxX < self.canvas.bounds.maxX && tempObject.frame.minY > self.canvas.bounds.minY && tempObject.frame.maxY < self.canvas.bounds.maxY) {
                                
                                // currentObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                                currentObject.transform = currentObject.transform.scaledBy(x: scale, y: scale)
                                
                                currentObject.scalingFactor = scalingFactor     // put here for smooth effect
                                
                            }
                    },
                        completion: { finished in
                            // currentObject.scalingFactor = scalingFactor
                    })
                }
            } else if let currentObject = objects[selected]! as? MyTextField {
                let scalingFactor = currentObject.scalingFactor * scale
                if Double(scalingFactor) >= minScalingFactor && Double(scalingFactor) <= maxScalingFactor {
                    UIView.animate(
                        withDuration: objectDrawing.scalingDuration,
                        animations: {
                            // currentObject.transform = CGAffineTransform(scaleX: scalingFactor , y: scalingFactor)
                            currentObject.transform = currentObject.transform.scaledBy(x: scale, y: scale)
                            currentObject.scalingFactor = scalingFactor     // put here for smooth effect

                    },
                        completion: { finished in
                            // currentObject.scalingFactor = scalingFactor
                    })
                }
            }
        } else {
            alertOpen()
        }

    }
    
    @IBAction func up(_ sender: AnyObject) {
        if let selected = selectedObjectID {
            let currentObject = objects[selected]!
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
            let currentObject = objects[selected]!
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
            let currentObject = objects[selected]!
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
            let currentObject = objects[selected]!
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
        if selectedObjectID != nil {
            performRotate()
        } else {
            alertOpen()
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
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let selected = selectedObjectID {
//            var location = CGPoint(x: 0, y: 0)
//            let touch = touches.first
//            location = (touch?.location(in: self.view))!
//            location.x = location.x - 170
//            location.y = location.y - 30
//            
//            if (location.x < canvas.bounds.minX) { location.x = canvas.bounds.minX + 32 }
//            if (location.x > canvas.bounds.maxX) { location.x = canvas.bounds.maxX - 32 }
//            if (location.y < canvas.bounds.minY) { location.y = canvas.bounds.minY + 32 }
//            if (location.y > canvas.bounds.maxY) { location.y = canvas.bounds.maxY - 32 }
//            
//            objects[selected]!.center = location
//            
//        }
//        
//    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let selected = selectedObjectID {
            var location = CGPoint(x: 0, y: 0)
            let touch = touches.first
            
            location = (touch?.location(in: self.view))!
            
            location.x = location.x - 135
            
            location.y = location.y - 30
            
            
            
            if (location.x - (objects[selected]!.frame.size.width / 2) < canvas.bounds.minX) { location.x = canvas.bounds.minX + (objects[selected]!.frame.size.width / 2) }
            
            
            
            if (location.x + objects[selected]!.bounds.maxX > canvas.bounds.maxX) { location.x = canvas.bounds.maxX - (objects[selected]!.frame.size.width / 2) }
            
            
            
            if (location.y - (objects[selected]!.frame.size.height / 2) < canvas.bounds.minY) { location.y = canvas.bounds.minY + (objects[selected]!.frame.size.height / 2) }
            
            
            
            if (location.y + objects[selected]!.bounds.maxY > canvas.bounds.maxY) { location.y = canvas.bounds.maxY - (objects[selected]!.frame.size.height / 2) }
            
            
            
            objects[selected]!.center = location
            
        }
    }
    
    
    //MARK: Private
    private func removeHighlight(object: UIView!){
        object.layer.borderWidth = 0
        object.layer.borderColor = UIColor.white.cgColor
    }
    
    private func highlightObject(object:UIView!){
        object.layer.borderWidth = CGFloat(objectDrawing.heighlightWidth)
        object.layer.borderColor = UIColor.blue.cgColor
    }
    
    private func removeObject(_ index: Int) {
        let idx = indexes.index(of: index)!
        indexes.remove(at: idx)
        objects[index]!.removeFromSuperview()
        objects.removeValue(forKey: index)
        selectedObjectID = nil
    }
    
    private func updateRotateDegree() {
        self.rotateDegree = self.rotateDegree * CGFloat(rotateOrientation)
    }
    
    // perform rotation with annimation
    private func performRotate() {
        print ("performing rotation: Rotation orientation: \(rotateOrientation) | Rotation degree: \(rotateDegree)")
        let currentObject = objects[selectedObjectID!]!
        UIView.animate(
            withDuration: Animation.RotateDuration,
            animations: {
                currentObject.transform = currentObject.transform.rotated(by: self.rotateDegree)
            },
            completion: { finished in
                
        })
    }
}
