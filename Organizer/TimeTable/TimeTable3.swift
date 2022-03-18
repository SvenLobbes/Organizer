//
//  TimeTable3.swift
//  Organizer
//
//  Created by Sven Lobbes on 05.08.21.
//

import Foundation
import UIKit

//4. TimeTable
class TimeTable3: UITableViewController{
    
    @IBOutlet var tableview: UITableView!
    
    
    override func viewDidLoad(){
        
       
        //GET DAY FOR TIMETABLE
        let userDefaults = UserDefaults.standard
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayOfTheWeekString = dateFormatter.string(from: date)
        
        if userDefaults.object(forKey: "Day") == nil{ // Check if String ist Empty
           userDefaults.set("", forKey: "Day") // Fill String if empty
          }
        
        userDefaults.set(dayOfTheWeekString, forKey: "Day") // Set Day in userDefaults String
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //FUNCS FOR TABLEVIEW
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userDefaults = UserDefaults.standard
        
        var returnInt = 0 // Set Integer for Changes and Returning
        
        if userDefaults.object(forKey: "Day") as! String == "Monday"{ //Check which Day
        
            
            let userDefaults = UserDefaults.standard
            if userDefaults.object(forKey: "TimeTableMonday") == nil{ //Check if Array is empty
                    let FillArray = [""]
                        userDefaults.set(FillArray, forKey: "TimeTableMonday") //If Array empty then fill with space
                    }
                
                    let myArray: [String] = userDefaults.object(forKey: "TimeTableMonday") as? [String] ?? [] // Set Task for local array
                
                    returnInt = myArray.count
            
        }
        
        else if userDefaults.object(forKey: "Day") as! String == "Tuesday"{ //Check which Day
            
            let userDefaults = UserDefaults.standard
            if userDefaults.object(forKey: "TimeTableTuesday") == nil{ //Check if Array is empty
                      let FillArray = [""]
                          userDefaults.set(FillArray, forKey: "TimeTableMonday") //If Array empty then fill with space
                      }
                  
                      let myArray: [String] = userDefaults.object(forKey: "TimeTableMonday") as? [String] ?? [] // Set Task for local array
                  
                      returnInt = myArray.count
            
        }
        
        else if userDefaults.object(forKey: "Day") as! String == "Wednesday"{
            
            let userDefaults = UserDefaults.standard
            if userDefaults.object(forKey: "TimeTableWednesday") == nil{ //Check if Array is empty
                      let FillArray = [""]
                          userDefaults.set(FillArray, forKey: "TimeTableWednesday") //If Array empty then fill with space
                      }
                  
                      let myArray: [String] = userDefaults.object(forKey: "TimeTableWednesday") as? [String] ?? [] // Set Task for local array
                  
                      returnInt = myArray.count
               
            
        }
        
        else if userDefaults.object(forKey: "Day") as! String == "Thursday"{
            
            let userDefaults = UserDefaults.standard
            if userDefaults.object(forKey: "TimeTableThursday") == nil{ //Check if Array is empty
                      let FillArray = [""]
                          userDefaults.set(FillArray, forKey: "TimeTableThursday") //If Array empty then fill with space
                      }
                  
                      let myArray: [String] = userDefaults.object(forKey: "TimeTableThursday") as? [String] ?? [] // Set Task for local array
                  
                      returnInt = myArray.count
            
            
        }
        
        else if userDefaults.object(forKey: "Day") as! String == "Friday"{
            
            let userDefaults = UserDefaults.standard
            if userDefaults.object(forKey: "TimeTableFriday") == nil{ //Check if Array is empty
                      let FillArray = [""]
                          userDefaults.set(FillArray, forKey: "TimeTableFriday") //If Array empty then fill with space
                      }
                  
                      let myArray: [String] = userDefaults.object(forKey: "TimeTableFriday") as? [String] ?? [] // Set Task for local array
                  
                      returnInt = myArray.count
            
        }
        
        
        return returnInt
        
    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        let userDefaults = UserDefaults.standard
                   
        
            if userDefaults.object(forKey: "Day") as! String == "Monday"{
                if editingStyle == .delete{
                    
                    if userDefaults.object(forKey: "TimeTableMonday") == nil{ //Check if Array is empty
                          let FillArray = [""]
                          userDefaults.set(FillArray, forKey: "TimeTableMonday") //If Array empty then fill with space
                      }
                    
                     var myArray: [String] = userDefaults.object(forKey: "TimeTableMonday") as? [String] ?? [] // Set Task for local array
                    
                    myArray.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                } else if editingStyle == .insert {
                    //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
                }

            }
        
            else if userDefaults.object(forKey: "Day") as! String == "Tuesday"{
                if editingStyle == .delete{
                    
                    if userDefaults.object(forKey: "TimeTableTuesday") == nil{ //Check if Array is empty
                          let FillArray = [""]
                          userDefaults.set(FillArray, forKey: "TimeTableTuesday") //If Array empty then fill with space
                      }
                    
                     var myArray: [String] = userDefaults.object(forKey: "TimeTableTuesday") as? [String] ?? [] // Set Task for local array
                    
                    myArray.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                } else if editingStyle == .insert {
                    //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
                }
                
            }
        
            else if userDefaults.object(forKey: "Day") as! String == "Wednesday"{
                if editingStyle == .delete{
                    
                    if userDefaults.object(forKey: "TimeTableWednesday") == nil{ //Check if Array is empty
                          let FillArray = [""]
                          userDefaults.set(FillArray, forKey: "TimeTableWednesday") //If Array empty then fill with space
                      }
                    
                     var myArray: [String] = userDefaults.object(forKey: "TimeTableWednesday") as? [String] ?? [] // Set Task for local array
                    
                    myArray.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                } else if editingStyle == .insert {
                    //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
                }
                
            }
        
            else if userDefaults.object(forKey: "Day") as! String == "Thursday"{
                if editingStyle == .delete{
                    
                    if userDefaults.object(forKey: "TimeTableThursday") == nil{ //Check if Array is empty
                          let FillArray = [""]
                          userDefaults.set(FillArray, forKey: "TimeTableThursday") //If Array empty then fill with space
                      }
                    
                     var myArray: [String] = userDefaults.object(forKey: "TimeTableThursday") as? [String] ?? [] // Set Task for local array
                    
                    myArray.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                } else if editingStyle == .insert {
                    //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
                }
                
            }
        
            else if userDefaults.object(forKey: "Day") as! String == "Friday"{
                if editingStyle == .delete{
                    
                    if userDefaults.object(forKey: "TimeTableFriday") == nil{ //Check if Array is empty
                          let FillArray = [""]
                          userDefaults.set(FillArray, forKey: "TimeTableFriday") //If Array empty then fill with space
                      }
                    
                     var myArray: [String] = userDefaults.object(forKey: "TimeTableFriday") as? [String] ?? [] // Set Task for local array
                    
                    myArray.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                } else if editingStyle == .insert {
                    //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
                }
                
            }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userDefaults = UserDefaults.standard
        
        //Declaration
        var returnCell = UITableViewCell()
            
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
        
        
        
        //SETS WHICH TIMETABLE IS USED ON THIS VIEWCONTROLLER
        if userDefaults.object(forKey: "Day") as! String == "Monday"{
            let myArray: [String] = userDefaults.object(forKey: "TimeTableMonday") as? [String] ?? []// Set TimeTableMonday for local array
            
            //Choose Color of TableViewCell
        
            if myArray[indexPath.row].contains("Color:Standard"){
                let myCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTable", for: indexPath) as! TableViewCellTimeTable
                myCell.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell
            }
            
            if myArray[indexPath.row].contains("Color:Blue"){
                let myCell1 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableBLUE", for: indexPath) as! TableViewCellTimeTableBLUE
                myCell1.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell1
            }
            
            if myArray[indexPath.row].contains("Color:Red"){
                let myCell2 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableRED", for: indexPath) as! TableViewCellTimeTableRED
                myCell2.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell2
            }
            
            if myArray[indexPath.row].contains("Color:Yellow"){
                let myCell3 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableYELLOW", for: indexPath) as! TableViewCellTimeTableYELLOW
                myCell3.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell3
            }
            
            if myArray[indexPath.row].contains("Color:Orange"){
                let myCell4 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableORANGE", for: indexPath) as! TableViewCellTimeTableORANGE
                myCell4.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell4
            }
            
            if myArray[indexPath.row].contains("Color:Purple"){
                let myCell5 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTablePURPLE", for: indexPath) as! TableViewCellTimeTablePURPLE
                myCell5.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell5
            }
            
            if myArray[indexPath.row].contains("Color:Green"){
                let myCell6 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableGREEN", for: indexPath) as! TableViewCellTimeTableGREEN
                myCell6.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell6
            }
            
            if myArray[indexPath.row].contains("Color:Black"){
                let myCell7 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableBLACK", for: indexPath) as! TableViewCellTimeTableBLACK
                myCell7.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell7
            }
            
            if myArray[indexPath.row].contains("Color:Gray"){
                let myCell8 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableGRAY", for: indexPath) as! TableViewCellTimeTableGRAY
                myCell8.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell8
            }
            
        }
        
        else if userDefaults.object(forKey: "Day") as! String == "Tuesday"{
            let myArray: [String] = userDefaults.object(forKey: "TimeTableTuesday") as? [String] ?? []
            
            //Choose Color of TableViewCell
        
            if myArray[indexPath.row].contains("Color:Standard"){
                let myCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTable", for: indexPath) as! TableViewCellTimeTable
                myCell.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell
            }
            
            if myArray[indexPath.row].contains("Color:Blue"){
                let myCell1 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableBLUE", for: indexPath) as! TableViewCellTimeTableBLUE
                myCell1.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell1
            }
            
            if myArray[indexPath.row].contains("Color:Red"){
                let myCell2 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableRED", for: indexPath) as! TableViewCellTimeTableRED
                myCell2.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell2
            }
            
            if myArray[indexPath.row].contains("Color:Yellow"){
                let myCell3 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableYELLOW", for: indexPath) as! TableViewCellTimeTableYELLOW
                myCell3.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell3
            }
            
            if myArray[indexPath.row].contains("Color:Orange"){
                let myCell4 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableORANGE", for: indexPath) as! TableViewCellTimeTableORANGE
                myCell4.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell4
            }
            
            if myArray[indexPath.row].contains("Color:Purple"){
                let myCell5 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTablePURPLE", for: indexPath) as! TableViewCellTimeTablePURPLE
                myCell5.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell5
            }
            
            if myArray[indexPath.row].contains("Color:Green"){
                let myCell6 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableGREEN", for: indexPath) as! TableViewCellTimeTableGREEN
                myCell6.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell6
            }
            
            if myArray[indexPath.row].contains("Color:Black"){
                let myCell7 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableBLACK", for: indexPath) as! TableViewCellTimeTableBLACK
                myCell7.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell7
            }
            
            if myArray[indexPath.row].contains("Color:Gray"){
                let myCell8 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableGRAY", for: indexPath) as! TableViewCellTimeTableGRAY
                myCell8.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell8
            }
            
        }
        
        else if userDefaults.object(forKey: "Day") as! String == "Wednesday"{
            let myArray: [String] = userDefaults.object(forKey: "TimeTableWednesday") as? [String] ?? []
            
            //Choose Color of TableViewCell
        
            if myArray[indexPath.row].contains("Color:Standard"){
                let myCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTable", for: indexPath) as! TableViewCellTimeTable
                myCell.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell
            }
            
            if myArray[indexPath.row].contains("Color:Blue"){
                let myCell1 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableBLUE", for: indexPath) as! TableViewCellTimeTableBLUE
                myCell1.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell1
            }
            
            if myArray[indexPath.row].contains("Color:Red"){
                let myCell2 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableRED", for: indexPath) as! TableViewCellTimeTableRED
                myCell2.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell2
            }
            
            if myArray[indexPath.row].contains("Color:Yellow"){
                let myCell3 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableYELLOW", for: indexPath) as! TableViewCellTimeTableYELLOW
                myCell3.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell3
            }
            
            if myArray[indexPath.row].contains("Color:Orange"){
                let myCell4 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableORANGE", for: indexPath) as! TableViewCellTimeTableORANGE
                myCell4.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell4
            }
            
            if myArray[indexPath.row].contains("Color:Purple"){
                let myCell5 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTablePURPLE", for: indexPath) as! TableViewCellTimeTablePURPLE
                myCell5.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell5
            }
            
            if myArray[indexPath.row].contains("Color:Green"){
                let myCell6 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableGREEN", for: indexPath) as! TableViewCellTimeTableGREEN
                myCell6.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell6
            }
            
            if myArray[indexPath.row].contains("Color:Black"){
                let myCell7 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableBLACK", for: indexPath) as! TableViewCellTimeTableBLACK
                myCell7.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell7
            }
            
            if myArray[indexPath.row].contains("Color:Gray"){
                let myCell8 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableGRAY", for: indexPath) as! TableViewCellTimeTableGRAY
                myCell8.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell8
            }
            
        }
        
        else if userDefaults.object(forKey: "Day") as! String == "Thursday"{
            let myArray: [String] = userDefaults.object(forKey: "TimeTableThursday") as? [String] ?? []
            
            //Choose Color of TableViewCell
        
            if myArray[indexPath.row].contains("Color:Standard"){
                let myCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTable", for: indexPath) as! TableViewCellTimeTable
                myCell.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell
            }
            
            if myArray[indexPath.row].contains("Color:Blue"){
                let myCell1 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableBLUE", for: indexPath) as! TableViewCellTimeTableBLUE
                myCell1.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell1
            }
            
            if myArray[indexPath.row].contains("Color:Red"){
                let myCell2 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableRED", for: indexPath) as! TableViewCellTimeTableRED
                myCell2.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell2
            }
            
            if myArray[indexPath.row].contains("Color:Yellow"){
                let myCell3 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableYELLOW", for: indexPath) as! TableViewCellTimeTableYELLOW
                myCell3.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell3
            }
            
            if myArray[indexPath.row].contains("Color:Orange"){
                let myCell4 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableORANGE", for: indexPath) as! TableViewCellTimeTableORANGE
                myCell4.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell4
            }
            
            if myArray[indexPath.row].contains("Color:Purple"){
                let myCell5 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTablePURPLE", for: indexPath) as! TableViewCellTimeTablePURPLE
                myCell5.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell5
            }
            
            if myArray[indexPath.row].contains("Color:Green"){
                let myCell6 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableGREEN", for: indexPath) as! TableViewCellTimeTableGREEN
                myCell6.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell6
            }
            
            if myArray[indexPath.row].contains("Color:Black"){
                let myCell7 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableBLACK", for: indexPath) as! TableViewCellTimeTableBLACK
                myCell7.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell7
            }
            
            if myArray[indexPath.row].contains("Color:Gray"){
                let myCell8 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableGRAY", for: indexPath) as! TableViewCellTimeTableGRAY
                myCell8.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell8
            }
            
        }
        
        else if userDefaults.object(forKey: "Day") as! String == "Friday"{
            let myArray: [String] = userDefaults.object(forKey: "TimeTableFriday") as? [String] ?? []
        
            //Choose Color of TableViewCell
        
            if myArray[indexPath.row].contains("Color:Standard"){
                let myCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTable", for: indexPath) as! TableViewCellTimeTable
                myCell.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell
            }
            
            if myArray[indexPath.row].contains("Color:Blue"){
                let myCell1 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableBLUE", for: indexPath) as! TableViewCellTimeTableBLUE
                myCell1.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell1
            }
            
            if myArray[indexPath.row].contains("Color:Red"){
                let myCell2 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableRED", for: indexPath) as! TableViewCellTimeTableRED
                myCell2.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell2
            }
            
            if myArray[indexPath.row].contains("Color:Yellow"){
                let myCell3 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableYELLOW", for: indexPath) as! TableViewCellTimeTableYELLOW
                myCell3.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell3
            }
            
            if myArray[indexPath.row].contains("Color:Orange"){
                let myCell4 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableORANGE", for: indexPath) as! TableViewCellTimeTableORANGE
                myCell4.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell4
            }
            
            if myArray[indexPath.row].contains("Color:Purple"){
                let myCell5 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTablePURPLE", for: indexPath) as! TableViewCellTimeTablePURPLE
                myCell5.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell5
            }
            
            if myArray[indexPath.row].contains("Color:Green"){
                let myCell6 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableGREEN", for: indexPath) as! TableViewCellTimeTableGREEN
                myCell6.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell6
            }
            
            if myArray[indexPath.row].contains("Color:Black"){
                let myCell7 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableBLACK", for: indexPath) as! TableViewCellTimeTableBLACK
                myCell7.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell7
            }
            
            if myArray[indexPath.row].contains("Color:Gray"){
                let myCell8 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTimeTableGRAY", for: indexPath) as! TableViewCellTimeTableGRAY
                myCell8.myLabel?.text = myArray[indexPath.row]
                returnCell = myCell8
            }
            
        }
        
            return returnCell
       
            
        }
        
        
        
    
    }
