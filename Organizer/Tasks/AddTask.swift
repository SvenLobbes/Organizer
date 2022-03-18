//
//  AddTask.swift
//  Organizer
//
//  Created by Sven Lobbes on 06.07.21.
//

import Foundation
import UIKit


//Code for TaskUI
class TaskErstellen: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var editNameTask: UITextField!
    @IBOutlet weak var editFachTask: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet weak var picker: UIPickerView!
    
    //Array Declaration for the picker
    var pickerData:[String] = [String]()
    
    var Date: String = "" //for Datepicker
    var itemA: String = "" //for editNameTask
    var itemB: String = "" //for editFachTask
    var ITEM: String = "" //Array for add compress
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        //Tapout Keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        
        //picker
        pickerData = ["Standard", "Blue", "Red","Yellow", "Orange", "Purple", "Green", "Black", "Gray"]
        
        //picker Connect Data
        self.picker.delegate = self
        self.picker.dataSource = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
    //FUNCS FOR COLORPICKER
        // Number of columns of data
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        // The number of rows of data
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return pickerData.count
        }
        
        // The data to return fopr the row and component (column) that's being passed in
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            MyVariables.stringColorTask = pickerData[row]
            return pickerData[row]
        }
    
    
    //Function for tapping out of edit
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
   
   
    
    @IBAction func btnTaskErstellen(sender: UIButton){
        
        //ALERTNOTIFICATION NAME
        let alertNAME = UIAlertController(title: "Task can not be added!", message: "The name of your task is missing.", preferredStyle: .alert)
        alertNAME.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        
        //ALERTNOTIFICATION SUBJECT
        let alertSUBJECT = UIAlertController(title: "Task can not be added!", message: "The subject of your task is missing. ", preferredStyle: .alert)
        alertSUBJECT.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        
        if let test1 = editNameTask.text, test1.isEmpty == true{
            self.present(alertNAME, animated: true)

        }
        else if let test2 = editFachTask.text, test2.isEmpty == true{
              self.present(alertSUBJECT, animated: true)
            
          }
              else {
        
              if let itemA = editNameTask.text, itemA.isEmpty == true {
                  editNameTask.text = nil
                  }
                  itemA = editNameTask.text!
          
                  if let itemB = editFachTask.text, itemB.isEmpty == true {
                  editFachTask.text = nil
                  }
                  itemB = editFachTask.text!
        
        
                  if Date.isEmpty == true {
                  // Add ITEM canceled
                  }
                  
                
                let userDefaults = UserDefaults.standard //Add item to NSUSERDEFAULTS
                var strings: [String] = userDefaults.object(forKey: "Task") as? [String] ?? [] //Read/Get ARRAY of Strings
                
                //Get Array Int Position
                let number: Int = strings.count
                let arraycount = String(number)
                
                //Compress all Strings together
                ITEM = ("Name:"+(itemA)+" "+"Subject:"+(itemB)+" "+"Date:"+(Date)+" "+"Color:"+(MyVariables.stringColorTask)+" "+"Position:"+(arraycount))
            
                strings.append(ITEM) //Append String to Array of Strings
            
                userDefaults.set(strings,forKey: "Task") //Write/Set Array of Strings
        }
        
        
        
        
        
        
        
       
        
      }
    
    //DatePicker (Datum der Tasks)
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()

           dateFormatter.dateStyle = DateFormatter.Style.long
           dateFormatter.timeStyle = DateFormatter.Style.short

        let strDate = dateFormatter.string(from: datePicker.date)
        
        Date = (strDate)
        
        
    }
    
}
