//
//  CrossObjectDetailViewController.swift
//  EasyDraw
//
//  Created by Xieyang Liu on 11/11/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class CrossObjectDetailViewController: UIViewController {

    weak var delegate: CrossOptionsPopoverresentationControllerDelegate?
    
    @IBOutlet weak var fat: UIButton!
    @IBOutlet weak var thin: UIButton!
    
    var _objectTag: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myimage = UIImage(view: CrossFatObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.fat.setImage(myimage, for: .normal)
        
        myimage = UIImage(view: CrossThinObject(frame: CGRect(x: 0, y: 0, width: objectDrawing.buttonSize, height: objectDrawing.buttonSize)))
        self.thin.setImage(myimage, for: .normal)
        
        
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
        print (sender.tag)
        _objectTag = sender.tag
        delegate?.updateCrossTag(sender.tag)
        dismiss(animated: true, completion: nil)
    }

}
