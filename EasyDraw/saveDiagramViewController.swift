//
//  saveDiagramViewController.swift
//  EasyDraw
//
//  Created by Hanling on 2016/11/14.
//  Copyright © 2016年 saifjilani. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 10.0, *)
class saveDiagramViewController: UIViewController {
    
    
    @IBOutlet weak var diagramTitle: UITextField!
    
    var objects = [Int: UIView]()
    var thumbnailCanvas : UIImage = UIImage()
    var isSaveSuccess : Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        preferredContentSize = view.systemLayoutSizeFitting(UILayoutFittingCompressedSize)  // auto-layout to fix size
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func alertOpen() {
        
        let dialog = UIAlertController(
            
            title: "You diagram has been saved! 😜",
            
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
        
        // dismiss the dialog
        
        self.dismiss(animated: true, completion: nil)
        
        // dismiss the saveDiagramController popover
        
        self.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func saveDiagram(_ sender: AnyObject) {
        self.save(isDefaultSave: false)
        
        if (self.isSaveSuccess) {
            
            alertOpen()
            
        }
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        
        let size = image.size
        
        
        
        let widthRatio  = targetSize.width  / image.size.width
        
        let heightRatio = targetSize.height / image.size.height
        
        
        
        // Figure out what our orientation is, and use that to form the rectangle
        
        var newSize: CGSize
        
        if(widthRatio > heightRatio) {
            
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
            
        } else {
            
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
            
        }
        
        
        
        // This is the rect that we've calculated out and this is what is actually used below
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        
        
        // Actually do the resizing to the rect using the ImageContext stuff
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        
        image.draw(in: rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        
        
        return newImage!
        
    }

    func save(isDefaultSave: Bool) {
        
        let path = getDocumentsDirectory()
        
        
        
        var titleToBeSaved = "DEFAULT_SAVE_ON_EXIT"
        
        
        
        if (!isDefaultSave) {
            
            titleToBeSaved = diagramTitle.text!
            
        }
        
        if (titleToBeSaved.isEmpty){
            
            let ac = UIAlertController(title: "Error!", message: "Your have to enter a title!.", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            
            present(ac, animated: true)
            
            return
            
        }
        
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        
        if (!isDefaultSave && !checkDuplicateDiagramName(title: titleToBeSaved)){
            
            let ac = UIAlertController(title: "Error!", message: "The title already exists!", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            
            present(ac, animated: true)
            
            return
            
        }
            
        else if (isDefaultSave && !checkDuplicateDiagramName(title: titleToBeSaved)) {
            
            // a default saved project already exists
            
            // delete it
            
            print("A default saved project already exists")
            
            var savedDiagrams : [SavedDiagram] = []
            
            do {
                
                let dir = getDocumentsDirectory().appendingPathComponent(titleToBeSaved).path
                
                try FileManager.default.removeItem(atPath: dir)
                
                savedDiagrams = try context.fetch(SavedDiagram.fetchRequest())
                
            } catch let error {
                
                print("Error: \(error.localizedDescription)")
                
            }
            
            
            
            for savedDiagram in savedDiagrams {
                
                if savedDiagram.title == titleToBeSaved {
                    
                    context.delete(savedDiagram)
                    
                }
                
            }
            
        }
        
        
        
        if (!createNewDirectory(title: titleToBeSaved)){
            
            let ac = UIAlertController(title: "Error!", message: "Error when saving!", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            
            present(ac, animated: true)
            
            return
            
        }
        
        let diagramDirectory = path.appendingPathComponent(titleToBeSaved)
        
        print("DiagramDirectory: " + (diagramDirectory.path))
        
        
        
        // save thumbnail
        
        let thumbnailCanvasPath = diagramDirectory.appendingPathComponent("thumbnailCanvas")
        
        let thumbnailCanvasFile = NSKeyedArchiver.archivedData(withRootObject: resizeImage(image: thumbnailCanvas, targetSize: CGSize(width: 100.0, height: 100.0)))
        
        do {
            
            try thumbnailCanvasFile.write(to: thumbnailCanvasPath)
            
        } catch {
            
            print("Couldn't save thumbnail canvas")
            
        }
        
        
        
        // save objects
        
        var objectFileNames = [String]()
        
        for object in objects.values {
            
            let objectFileName = UUID().uuidString
            
            let objectFileFullPath = diagramDirectory.appendingPathComponent(objectFileName)
            
            objectFileNames.append((objectFileFullPath.path))
            
            let objectFile = NSKeyedArchiver.archivedData(withRootObject: object)
            
            do {
                
                try objectFile.write(to: objectFileFullPath)
                
            } catch {
                
                print("Couldn't save object")
                
                return
                
            }
            
            print("Save object to " + (objectFileFullPath.path))
            
        }
        
        
        
        // save objectFileNames
        
        let objectArrayFileName = UUID().uuidString
        
        let objectArrayFile = NSKeyedArchiver.archivedData(withRootObject: objectFileNames)
        
        let objectArrayFileFullPath = diagramDirectory.appendingPathComponent(objectArrayFileName)
        
        
        
        do {
            
            try objectArrayFile.write(to: objectArrayFileFullPath)
            
        } catch {
            
            print("Couldn't save objectArray")
            
            return
            
        }
        
        
        
        
        
        let diagram = SavedDiagram(context: context)
        
        diagram.title = titleToBeSaved
        
        diagram.objectArrayFile = objectArrayFileFullPath.path
        
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        
        if (!isDefaultSave) {
            
            self.isSaveSuccess = true
            
        }
        
        
        
    }

    
    // return false if the title of the diagram already exists
    func checkDuplicateDiagramName(title: String!)-> Bool{
        let fm = FileManager.default
        var isDir : ObjCBool = false
        print("check duplicate diagram name")
        
        if fm.fileExists(atPath: getDocumentsDirectory().appendingPathComponent(title).path, isDirectory:&isDir) {
            if isDir.boolValue {
                // file exists and is a directory
                print("file exists and is a directory")
                return false
            } else {
                // file exists and is not a directory
                print("file exists and is not a directory")
                return true
            }
        } else {
            // file does not exist
            print("file does not exist")
            return true
        }
    }
    
    func createNewDirectory(title: String!)-> Bool{
        let newDir = getDocumentsDirectory().appendingPathComponent(title).path
        let fm = FileManager.default
        print("New Dir: " + (newDir))
        do {
            try fm.createDirectory(atPath: newDir,
                                   withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print("Error in createNewDirectory: \(error.localizedDescription)")
            return false
        }
        return true
    }
    
}
