//
//  ViewController.swift
//  CosolidatorVs
//
//  Created by STIelev on 2020-01-25.
//  Copyright © 2020 STIelev. All rights reserved.
//

import UIKit
import QuartzCore
import SwiftUI


class ViewController: UIViewController {


  
    override func viewDidLoad() {
        super.viewDidLoad()
      

        
        
        
        // Do any additional setup after loading the view.
        
     
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        
        self.ContanerViewMenuPopup?.isHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
        if(animated == true){
            
           
        }
    }

    @IBAction func TopTabMenuButton(_ sender: UIButton, forEvent event: UIEvent) {
        
     let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType(rawValue: "push")
        
   
    
                
        if(self.ContanerViewMenuPopup.isHidden){
            
            transition.subtype = CATransitionSubtype.fromRight
            self.ContanerViewMenuPopup.layer.add(transition, forKey: kCATransition)
            self.ContanerViewMenuPopup?.isHidden = false
        }else{
            
            transition.subtype = CATransitionSubtype.fromLeft
            self.ContanerViewMenuPopup.layer.add(transition, forKey: kCATransition)
            self.ContanerViewMenuPopup?.isHidden = true
        }

        
      
        print("Menu")
        
    }
    
    @IBOutlet weak var ContanerViewMenuPopup: UISegmentedControl!

    @IBOutlet weak var containerUIViewer: UIView!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var passwordFieldTitle : UILabel!
    @IBOutlet weak var passwordButtonTitle: UIButton!
    @IBOutlet weak var spieButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func spieButtonTouchInside(_ sender: UIButton, forEvent event: UIEvent) {
        
        passwordField.isSecureTextEntry = false;
    }
   
    
   
    
    @IBAction func passwordInputTouchInside(_ sender: UITextField) {
        
        
        passwordField.isSecureTextEntry = true;
    }
    

    
    @IBAction func userIdTextFieldTouchDown(_ sender: UITextField, forEvent event: UIEvent) {
         print("text")
         userIdTextField.boderColor = UIColor.lightGray
    }
    
    @IBAction func passwordTextFieldTouchDown(_ sender: UITextField, forEvent event: UIEvent) {
          
           passwordField.boderColor = UIColor.lightGray
      }
    var isAShift=true
    func loginViewComponentConfig() {
        
        

            
              
              if self.isAShift == true {
                
                passwordField.isHidden = true
                      spieButton.isHidden = true
                      passwordFieldTitle.isHidden = true
                      passwordField.text = " "; passwordButtonTitle.setTitle("Login", for: .normal)
                      loginButton.setTitle("Send", for: .normal)
                
                  loginButton.center.y = loginButton.center.y.advanced(by: -80)
                      self.isAShift=false;
                  
                  passwordButtonTitle.center.y = passwordButtonTitle.center.y.advanced(by: 436);
                  
                  passwordButtonTitle.center.x = passwordButtonTitle.center.x.advanced(by: 20);
                  
                  
                  self.view.bringSubviewToFront(passwordButtonTitle)
                
                print("IN")
              }else{
                  passwordField.isHidden = false
                         spieButton.isHidden = false
                         passwordFieldTitle.isHidden = false
                         passwordField.text = ""; passwordButtonTitle.setTitle("Forget password", for: .normal)
                    loginButton.setTitle("Login", for: .normal)
                  loginButton.center.y = loginButton.center.y.advanced(by: 80)
                              self.isAShift=true;
                          
                  passwordButtonTitle.center.y = passwordButtonTitle.center.y.advanced(by: -436);
                          
                          passwordButtonTitle.center.x = passwordButtonTitle.center.x.advanced(by: -20);
                          
                          
                          self.view.bringSubviewToFront(passwordButtonTitle)
                  
              }
           
          
              let passwordButtonTitleValue = passwordButtonTitle.titleLabel!.text?.description
              print (passwordButtonTitleValue as Any)
        
        
    }
    @IBAction func forgetPassword(_ sender:
        UIButton, forEvent event: UIEvent) {
       
        loginViewComponentConfig();
      
        
        
    }
    
 
    @IBAction func adminResetInputs(_ sender: UIButton, forEvent event: UIEvent) {
         passwordField.boderColor = UIColor.lightGray
         userIdTextField.boderColor = UIColor.lightGray
        
    }
    @IBAction func loginButton(_ sender: UIButton, forEvent event: UIEvent) {
        let userPassword : String = passwordField.text!
        let userID : String = userIdTextField.text!
        if userID == "" || userPassword == ""{
            
            if userPassword == ""{
                passwordField.boderColor = UIColor.red
            }
            
            if userID == ""{
                           userIdTextField.boderColor = UIColor.red
                       }
            
            let alert = UIAlertController(title: "warning", message: "The text field must not be left empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style:.default, handler: nil))
          self.present(alert, animated: true)
        }else{
            print("fköldf")
        }
          
     
    }

    }
   

    

   







          // Do any additional setup after loading the view.
      
    



