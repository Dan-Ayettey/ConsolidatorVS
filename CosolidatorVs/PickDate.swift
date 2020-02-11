//
//  PickDate.swift
//  CosolidatorVs
//
//  Created by STIelev on 2020-02-11.
//  Copyright © 2020 STIelev. All rights reserved.
//

import Foundation
import UIKit

class PickDate:ViewController, UITextFieldDelegate{
   
    @IBOutlet weak var start: UITextField!
       @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
         
     private var  dateFormatter = DateFormatter()
    @IBOutlet weak var endDate: UITextField!
    
 
    
    func startDateValueChange(dateFormatter:DateFormatter){
      
     
        if(self.startDate.placeholder == "MM/DD/YYS"){
            
                 startDate.inputView = datePicker
                                   datePicker.datePickerMode = .date
                                    startDate.text = dateFormatter.string(from: datePicker.date)
        }
      
         if(endDate.isSelected){
            endDate.inputView = datePicker
                             datePicker.datePickerMode = .date
                              endDate.text = dateFormatter.string(from: datePicker.date)
        }
                 
        
        
    }
    
    func endDate(dateFormatter:DateFormatter){
           startDate.inputView = datePicker
           datePicker.datePickerMode = .date
            startDate.text = dateFormatter.string(from: datePicker.date)
       }
    
         
   
         
       override func viewDidLoad() {
           super.viewDidLoad()
              
       
       }
     
       @IBAction func startDatePickerValueChanged(_ sender: UIDatePicker) {
             
         dateFormatter.dateFormat = "MM/dd/yyyy"
        
         startDateValueChange(dateFormatter: dateFormatter)
         
       }
    
    
    @IBAction func endDatePickerValueChanged(_ sender: UIDatePicker) {
               
           dateFormatter.dateFormat = "MM/dd/yyyy"
          
           endDate(dateFormatter: dateFormatter)
           
         }
   
   
    
    
}
