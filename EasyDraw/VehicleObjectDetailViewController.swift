//
//  VehicleObjectViewController.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/11/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class VehicleObjectDetailViewController: UIViewController {
    
    weak var delegate: VehicleOptionsPopoverresentationControllerDelegate?

    @IBOutlet weak var truck: UIButton!
    @IBOutlet weak var car: UIButton!
    
    var _objectTag: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myimage = UIImage(view: VehicleTruckObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.truck.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: VehicleCarObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.car.setImage(myimage, for: .normal)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        preferredContentSize = view.systemLayoutSizeFitting(UILayoutFittingCompressedSize)  // auto-layout to fix size
    }
    
    @IBAction func objectButtonPressed(_ sender: UIButton) {
        _objectTag = sender.tag
        delegate?.updateVehicleTag(sender.tag)
        dismiss(animated: true, completion: nil)
    }

}
