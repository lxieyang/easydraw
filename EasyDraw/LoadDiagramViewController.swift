//
//  LoadDiagramViewController.swift
//  EasyDraw
//
//  Created by Hanling on 2016/11/15.
//  Copyright © 2016年 saifjilani. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class LoadDiagramViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let loadDiagramSegueIdentifier = "LoadDiagramSegue"
    var diagrams : [SavedDiagram] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        title = "Load Diagram"
        
        getData()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == loadDiagramSegueIdentifier, let destination = segue.destination as? ViewController, let diagramIndex = tableView.indexPathForSelectedRow?.row {
            // load the objects
            destination.loadedObjects = loadDiagram(index: diagramIndex)
        }
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diagrams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Diagram", for: indexPath)
        cell.textLabel?.text = diagrams[indexPath.row].title
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            diagrams = try context.fetch(SavedDiagram.fetchRequest())
            print("load diagram info from core data")
        }
        catch {
            print("Fetching failed!")
        }
    }
    
    func loadDiagram(index: Int) -> [UIView] {
        let diagram = diagrams[index]
        var savedObjectFileNames : [String] = [String]()
        if let loadedObjectFileNames = NSKeyedUnarchiver.unarchiveObject(withFile: diagram.objectArrayFile!) as? [String] {
            savedObjectFileNames = loadedObjectFileNames
        }
        
        var loadedObjects = [UIView]()
        for filename in savedObjectFileNames {
            var savedObject : UIView = UIView()
            if let loadedObject = NSKeyedUnarchiver.unarchiveObject(withFile: filename) as? UIView {
                savedObject = loadedObject
            }
            loadedObjects.append(savedObject)
        }
        
        return loadedObjects
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            let diagram = diagrams[indexPath.row]
            do {
                let dir = getDocumentsDirectory().appendingPathComponent(diagram.title!).path
                try FileManager.default.removeItem(atPath: dir)
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
            context.delete(diagram)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do{
                diagrams = try context.fetch(SavedDiagram.fetchRequest())
                print("load diagram info from core data")
            }
            catch {
                print("Fetching failed!")
            }
        }
        
        tableView.reloadData()
    }
    
}
