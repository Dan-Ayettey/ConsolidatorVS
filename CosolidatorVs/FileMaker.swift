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

class FileMaker:ViewController, FileManagerDelegate{
    
    private var fileManager = FileManager.default
    private var path = Bundle.main.resourcePath
    
    func readFile(file: String, opt: String){
        
    
        do{
            let file = try fileManager.contentsOfDirectory(atPath: path!)
            
            for data in file{
                print(data)
            }
        }catch{
            
        }
        
    }
    func writeFile(file: String, opt: String){
        
        
    }
    func updateFile(file: String, opt: String){
        
        
    }
    
    func deleteFile(file: String, opt: String){
        
        
    }
    
}
