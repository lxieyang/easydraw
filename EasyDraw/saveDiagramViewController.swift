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
    
    @IBAction func saveDiagram(_ sender: AnyObject) {
        let path = getDocumentsDirectory()
        
        
        if (diagramTitle.text?.isEmpty)!{
            let ac = UIAlertController(title: "Error!", message: "Your have to enter a title!.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
            return
        }
        if (!checkDuplicateDiagramName(title: diagramTitle.text!)){
            let ac = UIAlertController(title: "Error!", message: "The title already exists!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
            return
        }
        if (!createNewDirectory(title: diagramTitle.text!)){
            let ac = UIAlertController(title: "Error!", message: "Error when saving!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
            return
        }
        let diagramDirectory = path.appendingPathComponent(diagramTitle.text!)
        print("DiagramDirectory: " + (diagramDirectory.path))
        
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
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let diagram = SavedDiagram(context: context)
        diagram.title = diagramTitle.text
        diagram.objectArrayFile = objectArrayFileFullPath.path
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        let ac = UIAlertController(title: "Saved!", message: "Your free body diagram has been saved.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        
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
