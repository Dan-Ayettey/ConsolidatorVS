//
//  FileMaker.swift
//  CosolidatorVs
//
//  Created by STIelev on 2020-02-25.
//  Copyright © 2020 STIelev. All rights reserved.
//

import Foundation
import UIKit
import FileProvider

class FileMaker:PickADate{
    
    @IBOutlet weak var activityName: UITextField!
    
    @IBOutlet weak var adminName: UITextField!
    
    @IBOutlet weak var typeOfActivity: UITextField!
    
    @IBOutlet weak var activityDescription: UITextField!
    
    @IBOutlet weak var day: UIDatePicker!
    
    @IBOutlet weak var locationName: UITextField!
   
    
   
    private var fileManager = FileManager.default
    private var path = Bundle.main.resourcePath
    
  
    @IBOutlet weak var comment: UITextView!
    
    @IBAction func Other(_ sender: UIButton, forEvent event: UIEvent) {
    }
    @IBAction func saveSheet(_ sender: UIButton) {
        
        print("Start Value",startTime!)
        let fName = "database"
         
       var fileReadString = ""
        print ("2: " + String(readFile(fileName: fName, read: &fileReadString)) + "\n" + fileReadString)
         
        let fileWriteString = "We are having fun eating Apples!"
        print ("1: " + String(writeFile(fileName: fName, data: fileWriteString))  + "\n" + fileWriteString)
         
       fileReadString = ""
        print ("2: " + String(readFile(fileName: fName, read: &fileReadString))
    )}
    
    func readFile(fileName: String, read: inout String)-> Bool{
        
     let desktopURL = try! FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        
        
          let fileURL = desktopURL.appendingPathComponent(fileName).appendingPathExtension("dat")
        
          if !(isFileEXist(path: fileURL.path)) {
              print("File Does Not Exist...")
           
          }else{
        
          print("File Path: \(fileURL.path)")
        
          do {
              read = try String(contentsOf: fileURL)
          } catch let error as NSError {
              print("Error: fileURL failed to read: \n\(error)" )
            
          }
         
        }
        return true
    }
   
    func isFileEXist(path:String)-> Bool{
        var isDirectory:ObjCBool = false ;
        let fm = FileManager.default;
        
        return (fm.fileExists(atPath:path, isDirectory: &isDirectory))
    }
    
    
    func writeFile(fileName:String, data:String)-> Bool{
        
       let desktopURL = try! FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
          print("desktopURL: " + String(describing: desktopURL))
          let fileURL = desktopURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
          print("File Path: \(fileURL.path)")
        
          do {
              try data.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
          } catch let error as NSError {
              print("Error: fileURL failed to write: \n\(error)" )
              return false
          }
         
        return true
        
        
    }
    func updateFile(file: String, opt: String){
        
        
    }
    
    func deleteFile(file: String, opt: String){
        
        
    }
    
}
