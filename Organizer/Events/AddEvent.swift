//
//  AddEvent.swift
//  Organizer
//
//  Created by Sven Lobbes on 06.07.21.
//

import Foundation
import UIKit


//Code for EventUI
class EventErstellen: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
  @IBOutlet var editEventName: UITextField!
  @IBOutlet var editEventInfo: UITextField!
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet weak var picker: UIPickerView!
    
    //Array Decleration for the picker
    var pickerData: [String] = [String]()
    
    
    var Date: String = "" //for Datepicker
    var itemC: String = "" //for editEventName
    var itemD: String = "" //for editEventInfo
    var ITEM: String = "" //ARRAY for add Compress
    
    override func viewDidLoad() {
        
        
        
        //Tapout Keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        //picker
        pickerData = ["Standard", "Blue", "Red", "Yellow", "Orange", "Purple", "Green", "Black", "Gray"]
        
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
                MyVariables.stringColorEvent = pickerData[row]
                return pickerData[row]
            }
    
    

    //Function for tapping out of edit
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //Function for creating an event
   @IBAction func btnEventErstellen(_ sender: Any) {
    
    //ALERTNOTIFICATION NAME
    let alertNAME = UIAlertController(title: "Event can not be added!", message: "The name of your event is missing.", preferredStyle: .alert)
    alertNAME.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
    
    //ALERTNOTIFICATION INFO
    let alertINFO = UIAlertController(title: "Event can not be added!", message: "The info of your event is missing.", preferredStyle:  .alert)
    alertINFO.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
    
    
    if let test1 = editEventName.text, test1.isEmpty == true{
        self.present(alertNAME, animated: true)
        
    }
        else if let test2 = editEventInfo.text, test2.isEmpty == true{
            self.present(alertINFO, animated: true)
            
        }
            else{
    
                if let itemC = editEventName.text, itemC.isEmpty == true {
                editEventName.text = nil
                }
                itemC = editEventName.text!

                if let itemD = editEventInfo.text, itemD.isEmpty == true {
                editEventInfo.text = nil
                }
                itemD = editEventInfo.text!
                
                let userDefaults = UserDefaults.standard
                var strings: [String] = userDefaults.object(forKey: "Event") as? [String] ?? [] //Read/Get Array of Strings
                
                //Get Array Int Position
                let number: Int = strings.count
                let arraycount = String(number)
                
                // Compress all Strings together
                ITEM = ("Name:"+(itemC)+" "+"Info:"+(itemD)+" "+"Date:"+(Date)+" "+"Color:"+(MyVariables.stringColorEvent)+" "+"Position:"+(arraycount))
                
                //Add item to NSUSERDEFAULTS
                strings.append(ITEM)
                userDefaults.set(strings, forKey: "Event")
       
    
    }
    
   }

    
    
    //Function for datePicker
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()

           dateFormatter.dateStyle = DateFormatter.Style.long
           dateFormatter.timeStyle = DateFormatter.Style.short

        let strDate = dateFormatter.string(from: datePicker.date)
        
        Date = strDate
    }
    

}
