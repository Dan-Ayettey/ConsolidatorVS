//
//  TextFieldInput.swift
//  CosolidatorVs
//
//  Created by STIelev on 2020-01-26.
//  Copyright © 2020 STIelev. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable extension UIView{

    
       @IBInspectable var cornerRadiuss: CGFloat{
              set{
                  layer.cornerRadius = newValue
              }
              
              get{
                  
                  return  layer.cornerRadius;
              }
          }
       @IBInspectable var borderWidths: CGFloat{
              set{
                  layer.borderWidth = newValue
              }
              
              get{
                  
                  return  layer.borderWidth;
              }
          }
    
    
    @IBInspectable var borderColors: UIColor?{
       set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
}




@IBDesignable extension UITextField{
    

    
  


    @IBInspectable var width: CGFloat{
        set{
            layer.borderWidth = newValue
        }
        
        get{
            
            return  layer.borderWidth;
        }
    }
    
    
   



    @IBInspectable var cornerRadius: CGFloat{
           set{
               layer.cornerRadius = newValue
           }
           
           get{
            
               return  layer.cornerRadius;
           }
       }
    @IBInspectable var borderWidth: CGFloat{
           set{
               layer.borderWidth = newValue
           }
           
           get{
               
               return  layer.borderWidth;
           }
       }
    @IBInspectable var boderColor: UIColor?{
           set {
                   guard let uiColor = newValue else { return }
                   layer.borderColor = uiColor.cgColor
            
               }
               get {
                   guard let color = layer.borderColor else { return nil }
                   return UIColor(cgColor: color)
               }
       }
}
