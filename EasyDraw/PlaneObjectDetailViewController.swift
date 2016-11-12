//
//  ObjectDetailViewController.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/11/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class PlaneObjectDetailViewController: UIViewController {
    
    weak var delegate: PlaneOptionsPopoverresentationControllerDelegate?

    @IBOutlet weak var planeside: UIButton!
    @IBOutlet weak var planeover: UIButton!
    @IBOutlet weak var planesea: UIButton!
    
    var _planeTag: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myimage = UIImage(view: PlaneSideObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.planeside.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: PlaneOverObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.planeover.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: PlaneSeaObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.planesea.setImage(myimage, for: .normal)


        

        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        preferredContentSize = view.systemLayoutSizeFitting(UILayoutFittingCompressedSize)  // auto-layout to fix size
    }

    @IBAction func planeButtonPressed(_ sender: UIButton) {
        _planeTag = sender.tag
        delegate?.updatePlaneModel(sender.tag)
        dismiss(animated: true, completion: nil)
    }
    
}
