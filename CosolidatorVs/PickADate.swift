//
//  PickDate.swift
//  CosolidatorVs
//
//  Created by STIelev on 2020-02-11.
//  Copyright © 2020 STIelev. All rights reserved.
//

import Foundation
import UIKit

class PickADate:ViewController{
       @IBOutlet weak var start: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
          
     @IBOutlet weak var scheduleDateLabel: UILabel!
     @IBOutlet weak var totalTime: UITextField!
     private var  dateFormatter = DateFormatter()
     @IBOutlet weak var end: UITextField!
     @IBOutlet weak var GMT: UITextField!
     
    private var date = "";
    @IBAction func previous(_ sender: UIButton, forEvent event: UIEvent) {
        dateFormatter.dateFormat = "dd"
        let day = Int(dateFormatter.string(from: datePicker.date))!
        
        dateFormatter.dateFormat = "MM"
              var month = Int(dateFormatter.string(from: datePicker.date))!
        
        dateFormatter.dateFormat = "yyyy"
            let year = Int(dateFormatter.string(from: datePicker.date))!
               
       
 
         
        date = String((day - 1))+"/"+String(month)+"/"+String(year)
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        guard let formatted = dateFormatter.date(from:  date) else{ month += month+1; return}
        datePicker.setDate(formatted, animated:true)
        formatDate(dateFormatter: dateFormatter)
               
        
            
        
    }
    
    @IBAction func Next(_ sender: Any, forEvent event: UIEvent) {
        
        dateFormatter.dateFormat = "dd"
               let day = Int(dateFormatter.string(from: datePicker.date))!
               
               dateFormatter.dateFormat = "MM"
                     var month = Int(dateFormatter.string(from: datePicker.date))!
               
               dateFormatter.dateFormat = "yyyy"
                   let year = Int(dateFormatter.string(from: datePicker.date))!
                      
              
        
                
               date = String((day + 1))+"/"+String(month)+"/"+String(year)
               
               dateFormatter.dateFormat = "dd/MM/yyyy"
               guard let formatted = dateFormatter.date(from:  date) else{ month += month+1; return}
               datePicker.setDate(formatted, animated:true)
               formatDate(dateFormatter: dateFormatter)
                      
    }
    @IBAction func totalTimeResult(_ sender: UITextField, forEvent event: UIEvent) {
        datePicker.datePickerMode = .dateAndTime;
       
      
         dateFormatter.dateFormat = "HH:mm"
        
        if(dateFormatter.date(from:sender.text!)) != nil{
            sender.boderColor = UIColor.systemGray6
                        sender.cornerRadius = 4
                        errorMessage.text = " "
                     
                    } else {
                        
                        sender.boderColor = UIColor.red
                        sender.layer.borderWidth = 1.0
                        errorMessage.text =  "The Time must be of this format: H:M"
                        errorMessage.textColor = UIColor.red
                        errorMessage.font = UIFont.init(descriptor: .init(), size: 14)
                    }
                    
                    if(sender.text == ""){
                        errorMessage.text = ""
                          sender.boderColor = UIColor.systemGray4
                                  sender.cornerRadius = 4
                                  errorMessage.text = " "
                                 
                        
                    }
    
        
        
    
         
       
     }
     
     func  formatDate(dateFormatter:DateFormatter){
       
            dateFormatter.dateFormat = "dd/MM/yyyy"
         
         
        if(start.placeholder! == "MM/DD/YYS"){
        stateDate(dateFormatter: dateFormatter)
            }
     if(end.placeholder! == "MM/DD/YYE"){
                   endDate(dateFormatter: dateFormatter)
           
            }
         
         dateFormatter.dateFormat = "HH:mm"
         time(dateFormatter: dateFormatter)
               
         dateFormatter.dateFormat = "am,pm"
         GMT(dateFormatter: dateFormatter)
        dateFormatter.dateFormat = "";
     }
     
    @IBAction func timeGMT(sender: UITextField){
      
        
        if(sender.text!.uppercased().contains("AM") || sender.text!.uppercased().contains("PM")){
                   sender.boderColor = UIColor.systemGray6
                               sender.cornerRadius = 4
                               errorMessage.text = " "
                            
                           } else {
                               
                               sender.boderColor = UIColor.red
                               sender.layer.borderWidth = 1.0
                               errorMessage.text =  "Format error: am or pm"
                               errorMessage.textColor = UIColor.red
                               errorMessage.font = UIFont.init(descriptor: .init(), size: 14)
                           }
                           
                           if(sender.text == ""){
                               errorMessage.text = ""
                                 sender.boderColor = UIColor.systemGray4
                                         sender.cornerRadius = 4
                                         errorMessage.text = " "
                                        
                               
                           }
        
        
    }
     func stateDate(dateFormatter:DateFormatter){
       
          
               start.text = dateFormatter.string(from: datePicker.date)
          }
     func endDate(dateFormatter:DateFormatter){
     
        
             end.text = dateFormatter.string(from: datePicker.date)
        }
     
          func time(dateFormatter:DateFormatter){
           
             totalTime.text = dateFormatter.string(from: datePicker.date)
             
             
              }
    
    func GMT(dateFormatter:DateFormatter){
        let slice = dateFormatter.string(from: datePicker.date);
       var drop = ""
        if(slice.count == 4){
            drop = slice.dropLast(2).description
        }else
       if(slice.count == 5){
                  drop = slice.dropLast(3).description
             }
    
        GMT.text = drop
             
             
              }
     @IBAction func callUpdate(_ sender: UIButton, forEvent event: UIEvent) {
         
        
         
     }
     
     func updateViews() {
         
       
         datePicker.datePickerMode = .dateAndTime
         
          dateFormatter.dateFormat = "dd/MM/yyyy"
       labelStateChange(label: scheduleDateLabel, contextText: dateFormatter.string(from: datePicker.date))
     }
      
     @IBAction func schedulerDatePickerValueChanged(_ sender: UIDatePicker) {
            
      
        
           
             datePicker.datePickerMode = .dateAndTime
            dateFormatter.dateFormat = "dd/MM/yyyy"
         labelStateChange(label: scheduleDateLabel, contextText: datePicker.date.description)
             
             
           }
        @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
         
   
          
        
          datePicker.datePickerMode = .dateAndTime
         
          formatDate(dateFormatter: dateFormatter)
        
         
          
          
        }
     func labelStateChange(label: UILabel, contextText: String) {
            
         label.text! = contextText
            
          
            
        }

     @IBAction func editingBegins(_ sender: UITextField ) {
      
      
        dateFormatter.dateFormat = "dd/MM/yyyy"
    
        let date = sender.text!;
  
       
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "dd/MM/yyyy"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        if dateFormatterGet.date(from: date
) != nil {
           
            sender.boderColor = UIColor.systemGray6
            sender.cornerRadius = 4
            errorMessage.text = " "
         
        } else {
            
            sender.boderColor = UIColor.red
            sender.layer.borderWidth = 1.0
            errorMessage.text =  "Date must of this format: 02/29/2016"
            errorMessage.textColor = UIColor.red
            errorMessage.font = UIFont.init(descriptor: .init(), size: 14)
        }
        
        if(sender.text == ""){
            errorMessage.text = ""
              sender.boderColor = UIColor.systemGray4
                      sender.cornerRadius = 4
                      errorMessage.text = " "
                     
            
        }
                  
     }
    
     @IBAction func endDateStateChange(_ sender: UITextField, forEach event: UIEvent) {
         
     
         start.placeholder = "MM/DD/YYSOFF"
         end.placeholder = "MM/DD/YYE"
         
       
         
     }
     func messenger(title: String, messanger: String){
         let alert = UIAlertController(title: title , message: messanger, preferredStyle: .alert)
         
         alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler:
             {
                 _ in

         })
         )
         
         self.present(alert, animated: true)
         
         
         
     }
     
     func matches(text: String, regex: String) -> Bool {
        
         let isValid = text.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
             
          
         if(isValid){
             
             return true
             
             
             
         }else{
             return false
         }
         
     }
     
     
     @IBAction func startDateStateChange(_ sender: UITextField, forEach event: UIEvent) {
        
         stateDate(dateFormatter: dateFormatter)
            start.placeholder = "MM/DD/YYS"
             end.placeholder = "MM/DD/YYEOFF"
           
       }
}
    
