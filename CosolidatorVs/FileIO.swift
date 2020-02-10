//
//  File.swift
//  CosolidatorVs
//
//  Created by STIelev on 2020-02-08.
//  Copyright © 2020 STIelev. All rights reserved.
//

import Foundation
import UIKit

class FileIO:ViewController{
  
    
    func fileExists(atPath path: String, isDir: ObjCBool ) -> Bool{
        
        let fm = FileManager.default
        let  isExist = UnsafeMutablePointer<ObjCBool>.allocate(capacity: 1)
        
        isExist[0] = isDir;
        
        return (fm.fileExists(atPath: path, isDirectory:  isExist))
    }
    func readFile(fileUrl: String){
        
    
    }
    
    
    
     func createFile(atPath path: String, contents data: Data?, attributes attr: [FileAttributeKey : Any]? = nil) -> Bool {
        if(fileExists(atPath: "", isDir: false)){
            return true
        }else{
            return false
        }
            
       
       
        
    }
     func createDirectory(at url: URL, withIntermediateDirectories createIntermediates: Bool, attributes: [FileAttributeKey : Any]? = nil) throws {
        
    }
    
  
    func execFileMakers()  {
        
    }
    
    
}
class Exception: FileManager{
    
    func catchError(message: String, file: String) throws {
        throw NSError(
            domain: file,
            code: 500,
            userInfo: [
                NSLocalizedDescriptionKey: message
            ]
        )
        
       
    }
    

  

}
