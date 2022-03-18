//
//  AddTimeTable4.swift
//  Organizer
//
//  Created by Sven Lobbes on 07.08.21.
//

import Foundation
import UIKit

class AddTimeTable4: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var editSubject: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var picker: UIPickerView!
    
    //Array Declaration for the picker
    var pickerData: [String] = [String]()
    
    var Date: String = "" //for Datepicker
    var itemA: String = "" //for editSubject
    var ITEM: String = "" //Array for add compress
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        //Dispose of any resources that can be recreated
    }
    
    
    //FUNCS FOR COLORPICKER
    //Number of Columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    // The Data to return for the row and component (column) thats being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        MyVariables.stringColorTimeTable = pickerData[row]
        return pickerData[row]
    
        
    }
    
    //Function for tapping out of edit
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    
    
    @IBAction func AddToTimeTable(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        
        //ALERTNOTIFICATION NAME
        let alertSUBJECT = UIAlertController(title: "Subject can not be added!", message: "The name of your subject is missing.", preferredStyle: .alert)

        //CHECK IF EVERYTHING IS FILLED
        if let test = editSubject.text, test.isEmpty == true {
            self.present(alertSUBJECT, animated: true)
        }
        
        //CHECK IF SPECIFIC ARRAYS ARE EMPTY
        if userDefaults.object(forKey: "TimeTableMonday") == nil{ //Check if Array is empty
            let FillArray = [""]
            userDefaults.set(FillArray, forKey: "TimeTableMonday") // If Array is empty then fill with space
        }
             
        if userDefaults.object(forKey: "TimeTableTuesday") == nil{ //Check if Array is empty
            let FillArray = [""]
            userDefaults.set(FillArray, forKey: "TimeTableTuesday") // If Array is empty then fill with space
        }
        
        if userDefaults.object(forKey: "TimeTableWednesday") == nil{ //Check if Array is empty
            let FillArray = [""]
            userDefaults.set(FillArray, forKey: "TimeTableWednesday") // If Array is empty then fill with space
        }
        
        if userDefaults.object(forKey: "TimeTableThursday") == nil{ //Check if Array is empty
            let FillArray = [""]
            userDefaults.set(FillArray, forKey: "TimeTableThursday") // If Array is empty then fill with space
        }
        
        if userDefaults.object(forKey: "TimeTableFriday") == nil{ //Check if Array is empty
            let FillArray = [""]
            userDefaults.set(FillArray, forKey: "TimeTableFriday") // If Array is empty then fill with space
        }
    
        if userDefaults.object(forKey: "Day") as! String == "Monday"{
            var strings: [String] = userDefaults.object(forKey: "TimeTableMondy") as? [String] ?? [] //Get ARRAY of Strings
            
            if let itemA = editSubject.text, itemA.isEmpty{
                editSubject.text = nil
            }
            itemA = editSubject.text!
            
            
            //Get Array Int Position
            let number: Int = strings.count
            let arraycount = String(number)
            
            //Compress all Strings together
          let ITEM = ("Subject:"+(itemA)+"Color:"+(MyVariables.stringColorTimeTable)+"Date:"+(Date)+"Position:"+(arraycount)  )
            
            strings.append(ITEM) //append String to Array of Strings
            
            userDefaults.set(strings, forKey: "TimeTableMonday") //Write/Set Array of Strings
            
         }
        
        else if userDefaults.object(forKey: "Day") as! String == "Tuesday"{
            var strings: [String] = userDefaults.object(forKey: "TimeTableTuesday") as? [String] ?? [] // Get ARRAY of Strings
            
            //Get Array Int Position
            let number: Int = strings.count
            let arraycount = String(number)
            
            
            if let itemA = editSubject.text, itemA.isEmpty{
                editSubject.text = nil
            }
            itemA = editSubject.text!
            
            //Compress all Strings together
            let ITEM = ("Subject:"+(itemA)+"Color:"+(MyVariables.stringColorTimeTable)+"Date:"+(Date)+"Position:"+(arraycount)  )
            
            strings.append(ITEM) //append String to Array of Strings
            
            userDefaults.set(strings, forKey: "TimeTableTuesday")
        }
            
        else if userDefaults.object(forKey: "Day") as! String == "Wednesday"{
            var strings: [String] = userDefaults.object(forKey: "TimeTableWednesday") as? [String] ?? [] // Get ARRAY of Strings
            
            //Get Array Int Position
            let number: Int = strings.count
            let arraycount = String(number)
            
            if let itemA = editSubject.text, itemA.isEmpty{
                editSubject.text = nil
            }
            itemA = editSubject.text!
                
            //Compress all Strings together
            let ITEM = ("Subject:"+(itemA)+"Color:"+(MyVariables.stringColorTimeTable)+"Date:"+(Date)+"Position:"+(arraycount)  )
            
            strings.append(ITEM) //append String to Array of Strings
            
            userDefaults.set(strings, forKey: "TimeTableWednesday")
                        
        }
        
        else if userDefaults.object(forKey: "Day") as! String == "Thursday"{
            var strings: [String] = userDefaults.object(forKey: "TimeTableThursday") as? [String] ?? [] // Get ARRAY of Strings
            
            //Get Array Int Position
            let number: Int = strings.count
            let arraycount = String(number)
            
            //Compress all Strings together
            let ITEM = ("Subject:"+(itemA)+"Color:"+(MyVariables.stringColorTimeTable)+"Date:"+(Date)+"Position:"+(arraycount)  )
            
            strings.append(ITEM) //append String to Array of Strings
            
            userDefaults.set(strings, forKey: "TimeTableThursday")
        }
        
        else if userDefaults.object(forKey: "Day") as! String == "Friday"{
            var strings: [String] = userDefaults.object(forKey: "TimeTableFriday") as? [String] ?? [] // Get ARRAY of Strings
            
            //Get Array Int Position
            let number: Int = strings.count
            let arraycount = String(number)
            
            //Compress all Strings together
            let ITEM = ("Subject:"+(itemA)+"Color:"+(MyVariables.stringColorTimeTable)+"Date:"+(Date)+"Position:"+(arraycount)  )
            
            strings.append(ITEM)// append String to Array of Strings
            
            userDefaults.set(strings, forKey: "TimeTableFriday")
            
        }
        
        
        
        
    }

    //Datepicker (Uhrzeit der Subjects)
    @IBAction func datePickerChanged(_ sender: Any){
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let strDate = dateFormatter.string(from: datePicker.date)
        
        Date = (strDate)
        
    }
    
    
}
