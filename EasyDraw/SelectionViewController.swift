//
//  SelectionViewController.swift
//  EasyDraw
//
//  Created by Saif Jilani on 9/28/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    @IBOutlet var triangle: UIImageView!
    @IBOutlet var rectangle: UIImageView!
    @IBOutlet var arrow: UIImageView!

    var objects = [UIImageView]()
    var selectedObjectID: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        objects = [triangle, rectangle, arrow]
    }

    @IBAction func selectObject(_ sender: AnyObject) {
        selectedObjectID = 0
        highlightObject(object: objects[selectedObjectID!])
    }
    
    @IBAction func prevSelectedObject(_ sender: AnyObject) {
        //there should be a bool of which tool is currently in use
        //to decide how to use this function
        //crash if nil at this stage
        removeHighlight(object: objects[selectedObjectID!])
        selectedObjectID = selectedObjectID! == 0 ?
            objects.count - 1 : selectedObjectID! - 1
        highlightObject(object: objects[selectedObjectID!])
    }

    @IBAction func nextSelectedObject(_ sender: AnyObject) {
        //there should be a bool of which tool is currently in use
        //to decide how to use this function
        //crash if nil at this stage
        removeHighlight(object: objects[selectedObjectID!])
        selectedObjectID = selectedObjectID! == objects.count - 1 ?
            0 : selectedObjectID! + 1
        highlightObject(object: objects[selectedObjectID!])

    }

    func removeHighlight(object: UIImageView!){
        object.layer.borderWidth = 0
        object.layer.borderColor = UIColor.white.cgColor
    }

    func highlightObject(object:UIImageView!){
        object.layer.borderWidth = 2
        object.layer.borderColor = UIColor.blue.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

