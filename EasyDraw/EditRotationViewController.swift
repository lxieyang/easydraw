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
    
    /* MARK: View Controller Lifecycle */

    override func viewDidLoad() {
        super.viewDidLoad()
        print ("view did load for popover")
        print ("_rotationOrientation: \(_rotationOrientation)")
        print ("_rotationDegree: \(_sliderValue)")
        sliderValue = _sliderValue
        rotationOrientation = _rotationOrientation
        print ("rotationOrientation: \(rotationOrientation)")
        print ("rotationDegree: \(sliderValue)")

        syncRotationOrientationLabel()
        
        updateSliderUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        preferredContentSize = view.systemLayoutSizeFitting(UILayoutFittingCompressedSize)  // auto-layout to fix size
    }
    
    
    /* MARK: Slider Methods */
    // slider value
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
    
    // slider value being changed
    @IBAction func sliderValueChange(_ sender: UISlider) {
        sliderValue = Int(sender.value)
    }
    
    // update slider label
    private func updateSelectedValue() {
        self.sliderLabel.text = String(describing: sliderValue!).appending("°")
    }
    
    // approximate slider value
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
    
    
    /* Rotation Segmented Control */
    var rotationOrientation: String!
    var _rotationOrientation: String?
    
    @IBOutlet weak var rotationOrientationControl: UISegmentedControl! {
        didSet {
            rotationOrientation = updateOrientation()
            print (rotationOrientation)

        }
    }
    
    // rotation orientation changes
    @IBAction func rotationOrientationChange(_ sender: UISegmentedControl) {
        rotationOrientation = updateOrientation()
        print (rotationOrientation)

    }
    
    // update rotation orientation according to outlet
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
    
    // sync rotation label
    private func syncRotationOrientationLabel() {
        if rotationOrientation == "clockwise" {
            rotationOrientationControl.selectedSegmentIndex = 0
        } else {
            rotationOrientationControl.selectedSegmentIndex = 1
        }
    }
}
