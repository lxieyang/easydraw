//
//  EditRotationViewController.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 10/13/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class EditRotationViewController: UIViewController {
    
    weak var delegate: RotationPopoverPresentationControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        print ("view did load for popover")
        print ("_rotationOrientation: \(_rotationOrientation)")
        print ("_rotationDegree: \(_sliderValue)")
        // Do any additional setup after loading the view.
        // _sliderValue = Int(self.slider.value)
        sliderValue = _sliderValue
        rotationOrientation = _rotationOrientation
        syncRotationOrientationLabel()
        
        updateSliderUI()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        preferredContentSize = view.systemLayoutSizeFitting(UILayoutFittingCompressedSize)  // autolayout to fix size
    }
    
    
    var sliderValue: Int? {
        didSet {
            updateSliderUI()
        }
    }
    
    var _sliderValue: Int?
    
    private func updateSliderUI() {
        approximateRotationAngle()
        // updateSelectedValue()
        slider.setValue(Float(_sliderValue!), animated: true)
        delegate?.updateRotationDegree(_sliderValue!)
    }

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        sliderValue = Int(sender.value)
    }
    
    private func updateSelectedValue() {
        
        self.sliderLabel.text = String(describing: sliderValue!).appending("°")
    }
    
    private func approximateRotationAngle() {
        var approxAngle: Int = 0
        var minDist: Int = 180
        for (key, _) in RotationDegree {
            let dist = abs(key - sliderValue!)
            if dist < minDist {
                minDist = dist
                approxAngle = key
            }
        }
        _sliderValue = approxAngle
        self.sliderLabel.text = String(describing: approxAngle).appending("°")
        print ("approx angle: \(approxAngle) , minDist: \(minDist)")
    }
    
    var rotationOrientation: String!
    var _rotationOrientation: String?
    
    @IBOutlet weak var rotationOrientationControl: UISegmentedControl! {
        didSet {
            rotationOrientation = updateOrientation()
            print (rotationOrientation)

        }
    }
    @IBAction func rotationOrientationChange(_ sender: UISegmentedControl) {
        rotationOrientation = updateOrientation()
        print (rotationOrientation)

    }
    
    private func updateOrientation() -> String! {
        var or: String!
        switch rotationOrientationControl.selectedSegmentIndex {
        case 0:
            or = "clockwise"
        case 1:
            or = "counterClockwise"
        default: break
        }
        
        delegate?.updateRotationOrientation(or)
        
        return or
    }
    
    private func syncRotationOrientationLabel() {
        if rotationOrientation == "clockwise" {
            rotationOrientationControl.selectedSegmentIndex = 0
        } else {
            rotationOrientationControl.selectedSegmentIndex = 1
        }
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
