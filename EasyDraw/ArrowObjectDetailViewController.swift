//
//  ArrowObjectDetailViewController.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/12/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class ArrowObjectDetailViewController: UIViewController {

    weak var delegate: ArrowOptionsPopoverresentationControllerDelegate?
    
    @IBOutlet weak var bold: UIButton!
    @IBOutlet weak var narrow: UIButton!
    
    var _objectTag: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myimage = UIImage(view: ArrowBoldObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.bold.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: ArrowNarrowObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.narrow.setImage(myimage, for: .normal)
        
        
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
        print ("press")
        _objectTag = sender.tag
        delegate?.updateArrowTag(sender.tag)
        dismiss(animated: true, completion: nil)
    }

}
