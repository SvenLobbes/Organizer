//
//  MainSettings.swift
//  Organizer
//   test from nano 
//  Created by Sven Lobbes on 06.07.21.
//

import Foundation
import UIKit



//Settings for whole Organizer
class MainSettings: UIViewController {
    //Username for Greeting
   
    @IBOutlet var editNameEingabe: UITextField!
    
    
    
    override func viewDidLoad() {
        
        
        //CurrentName Label
        let userDefaults = UserDefaults.standard
        let CurrentName = userDefaults.object(forKey: "UserName") as! String
        self.editNameEingabe.text = ""+(CurrentName)+""
        
        //Tapout Keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        
        
    }
    
    

    //Function for tapping out of edit
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    

    //Add Username for Organizer
    @IBAction func AddUserName(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        
        if let Name = editNameEingabe.text, Name.isEmpty == false {
            userDefaults.set(Name, forKey: "UserName")
    }
        editNameEingabe.text = nil
    }
    
    
    }
