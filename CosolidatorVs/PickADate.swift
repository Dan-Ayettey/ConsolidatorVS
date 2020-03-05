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
    @IBOutlet weak var startTime: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var scheduleDateLabel: UILabel!
     @IBOutlet weak var totalTime: UITextField!
     private var  dateFormatter = DateFormatter()
     @IBOutlet weak var endTime: UITextField!
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
    let month = Int(dateFormatter.string(from: datePicker.date))!
            
            dateFormatter.dateFormat = "yyyy"
                let year = Int(dateFormatter.string(from: datePicker.date))!
                    
            
    
            
            date = String((day + 1))+"/"+String(month)+"/"+String(year)
            
            dateFormatter.dateFormat = "dd/MM/yyyy"
            guard let formatted = dateFormatter.date(from:  date) else{ return}
            datePicker.setDate(formatted, animated:true)
            formatDate(dateFormatter: dateFormatter)
                    
}
    @IBAction func totalTimeResult(_ sender: UITextField, forEvent event: UIEvent) {
        datePicker.datePickerMode = .dateAndTime;
        /*
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
    
        
        */
    
     }
     
     func  formatDate(dateFormatter:DateFormatter){
       
           dateFormatter.dateFormat = "HH:MM"
         
         
        if(startTime.placeholder! == "H:Ms"){
        stateDate(dateFormatter: dateFormatter)
            }else
     if(endTime.placeholder! == "H:Me"){
        
        endDate(dateFormatter: dateFormatter)
           
            }
         
         
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
               startTime.text = dateFormatter.string(from: datePicker.date)
          }
     func endDate(dateFormatter:DateFormatter){
             endTime.text = dateFormatter.string(from: datePicker.date)
        }
     
          func time(dateFormatter:DateFormatter){
        
        
            /*
           
            let end = endTime.text!
            let start = startTime.text!
                        
                  print(end)
             let startTime = Int(start)
            let endTime = Int(end)!
            let total = Int(startTime!+endTime)*/
            // dateFormatter.dateFormat = "HH";
            var startHour = Int(startTime.text!.dropLast(3)) ?? 0;
            let startMinutes = Int(startTime.text!) ?? 0;
            var endHour = Int(endTime.text!.dropLast(3)) ?? 0;
            let endMinute = Int(endTime.text!.dropLast(3))
            var totalHours = 0;
            var totalMinutes = 0;
            var remender = 0;
             
          
            if(startHour > 12){
                startHour = startHour - 12
            }
            if(endHour > startHour){
                totalHours = endHour-startHour;

            }else{
                totalHours = endHour-startHour;
            }
           
            if(endHour != 0 && startHour != 0){
                dateFormatter.dateFormat = String(totalHours)+":"+String(totalMinutes+remender);
                
                totalTime.text = dateFormatter.string(from: datePicker.date);
            }
          
            /*
            if(GMT.text == "PM" && endHour ?? 0 > 12 ){

                 totalHours = ((endHour ?? 0)-12)%((startHour ?? 0)-12);
                 totalMinutes = ((endMinute ?? 0)+(startMinutes ?? 0));
                
                 
                 if(totalMinutes > 60){
                     
                 totalMinutes = ((endMinute ?? 0) + (startMinutes ?? 0))/60;
                     remender = ((endMinute ?? 0) + (startMinutes ?? 0))%60
                     
                 dateFormatter.dateFormat = String(totalHours)+":"+String(totalMinutes+remender);
                              }else{
                 remender = ((endMinute ?? 0) + (startMinutes ?? 0))%60
                                     
                    dateFormatter.dateFormat = String(totalHours)+":"+String(totalMinutes+remender);
                    
                    totalTime.text = dateFormatter.string(from: datePicker.date);
                              
                            
                 
                 }
            }else{
            
                totalHours = (endHour ?? 0)%(startHour ?? 0);
                                         totalMinutes = ((endMinute ?? 0)+(startMinutes ?? 0));
                                  dateFormatter.dateFormat = String(totalHours)+":"+String(totalMinutes+remender);
                               
                               totalTime.text = dateFormatter.string(from: datePicker.date);
            }
                */
            
            
                if(totalHours == 0){
             
                
                
                          
                        
            }
            
      
           
      
            
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
   
     func updateViews() {
         datePicker.datePickerMode = .dateAndTime
         dateFormatter.dateFormat = "HH:MM"
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
        let date = sender.text!;
        let dateFormatterGet = dateFormatter
        dateFormatterGet.dateFormat = "HH:MM"
        let dateFormatterPrint = dateFormatter
        dateFormatterPrint.dateFormat = "HH:MM"
        if dateFormatterGet.date(from: date
) != nil {
           
            sender.boderColor = UIColor.systemGray6
            sender.cornerRadius = 4
            errorMessage.text = ""
         
        } else {
            
            sender.boderColor = UIColor.red
            sender.layer.borderWidth = 1.0
            errorMessage.text =  "Time must of this format: HH:MM"
            errorMessage.textColor = UIColor.red
            errorMessage.font = UIFont.init(descriptor: .init(), size: 14)
        }
        
        if(sender.text == ""){
            errorMessage.text = ""
              sender.boderColor = UIColor.systemGray4
                      sender.cornerRadius = 4
                      errorMessage.text = ""
                     
            
        }
    
                  
     }
    
     @IBAction func endDateStateChange(_ sender: UITextField, forEach event: UIEvent) {
         
        
         startTime.placeholder = "H:MsOFF"
         sender.placeholder = "H:Me"
         
       
         
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
        
             sender.placeholder = "H:Ms"
             endTime.placeholder = "H:MsOFF"
           
       }
}
    
