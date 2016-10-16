//
//  DrawViewController.swift
//  EasyDraw
//
//  Created by Hanling on 10/16/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit


@available(iOS 10.0, *)
class DrawViewController: UIViewController {
    
    let DEFAULT_SIZE = CGSize(width: 200, height: 200)
    
    var objects = [UIImageView]()
    
    var SHAPES : [String] = ["square_400", "circle_400", "arrow_400"]

    @IBAction func DrawButtonPressed(_ sender: AnyObject) {
        let image : UIImage = UIImage(named:SHAPES[sender.tag])!
        let imageView : UIImageView = UIImageView(image: image)
        imageView.frame = CGRect(origin: CGPoint(x: 200,y :100), size: CGSize(width: image.size.width, height: image.size.height))
        objects.append(imageView)
        
        viewDidLoad()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for object in objects{
            self.view.addSubview(object)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
