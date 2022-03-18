//
//  ViewController.swift
//  Organizer
//
//  Created by Sven Lobbes on 18.05.21.
//

import UIKit

//Global Variables
struct MyVariables{
    let userDefaults = UserDefaults.standard
    
    // ("UserName") for personal Username
    
    
    
    // ("Task") for Taskentry
    // ("TaskSorted") for Preview at HomeViewcontroller
    // ("TaskSortBySubject") Sorted Taskentry into Sorted List
    
    
    
    // ("Event") for Eventent
    // ("EventSorted") for Preview at HomeViewController
    // ("EventSortBySubject") Sorted Evententry into Sorted List 
    
    
    
    // ("Appearance") for Dark/Lightmode
    
    
    
    // ("DISPLAYMODETASK") for Sorted List
    
    
    
    
    // ("Day") for Timetable Position
    
    
    
    // ("TimeTableMonday") for TimeTable
    // ("TimeTableTuesday") for TimeTable
    // ("TimeTableWednsday") for TimeTable
    // ("TimeTableThursday") for TimeTable
    // ("TimeTableFriday") for TimeTable
    
    
    //Global Variables
    
    
    //FOR TASK
    static var Taskarray: [String] = []
    static var stringColorTask = ""
    
    
    //FOR EVENT
    static var Eventarray: [String] = []
    static var stringColorEvent = ""
    
    //FOR TIMETABLE
    static var stringColorTimeTable = ""
    
   
    
    
}



//HomePAGE
class Home: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var lblNextSubjects: UILabel!
    @IBOutlet weak var lblGreeting: UILabel!
    
    
    @IBOutlet var tableViewTASK: UITableView!
    @IBOutlet var tableViewEVENT: UITableView!
    
    
    //Autostart Befehle :
    override func viewDidLoad() {
        
        UIApplication.shared.windows.forEach { window in
            window.overrideUserInterfaceStyle = .light
        }
        
        
        
        // UserName ABFRAGE
        let userDefaults = UserDefaults.standard
        if  userDefaults.object(forKey: "UserName") == nil{
            userDefaults.set("", forKey: "UserName")
        }
        
        let USERNAME = userDefaults.object(forKey: "UserName") as! String
        
        let randomInt = Int.random(in: 1..<5)
        if randomInt == 1 {
               lblGreeting.text = "Hey welcome "+(USERNAME)+"!"
           }
         else if randomInt == 2 {
               lblGreeting.text = "Hello "+(USERNAME)+"!"
           }
         else if randomInt == 3 {
               lblGreeting.text = "Hey, welcome "+(USERNAME)+"!"
           }
         else if randomInt == 4 {
              lblGreeting.text = "Hello there, "+(USERNAME)+"!"
           }
         else {
              lblGreeting.text = "Nice to see you "+(USERNAME)+"!"}
        
        //Sort LISTS FOR TASKS AND EVENTS
        SortByDateTasks()
        SortByDateEvents()
        
        //GET DAY FOR TIMETABLE
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayOfTheWeekString = dateFormatter.string(from: date)
        
        CheckIfDayArrayEmpty()
        
        userDefaults.set(dayOfTheWeekString, forKey: "Day") // Set Day in userDefaults String
        
        //NextSubjectslabel with the currentdate
      //  let currentDay = userDefaults.object(forKey: "Day") as! String
      //  lblNextSubjects.text = "Next Subjects    "+(currentDay)+" "
        
        
        
        //TASK PREVIEW
        let nib = UINib(nibName: "TableViewCellTASK", bundle: nil)
        tableViewTASK.register(nib, forCellReuseIdentifier: "TableViewCellTASK")
        tableViewTASK.delegate = self
        tableViewTASK.dataSource = self
        
        //EVENT PREVIEW
        let nib2 = UINib(nibName: "TableViewCellEVENT", bundle: nil)
        tableViewEVENT.register(nib2, forCellReuseIdentifier: "TableViewCellEVENT")
        tableViewEVENT.delegate = self
        tableViewEVENT.dataSource = self 
        
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func SortByDateTasks() {
        let userDefaults = UserDefaults.standard
        
        CheckIfTaskArrayEmpty()
        
        let UnsortedArray: [String] = userDefaults.object(forKey: "Task") as? [String] ?? []
        
        //Declaration of the months
        //The UnsortedArray gets divided in the seperate montharrays
        var UnsortedArrayJanuary: [String] = []
        var UnsortedArrayFebruary: [String] = []
        var UnsortedArrayMarch: [String] = []
        var UnsortedArrayApril: [String] = []
        var UnsortedArrayMay: [String] = []
        var UnsortedArrayJune: [String] = []
        var UnsortedArrayJuly: [String] = []
        var UnsortedArrayAugust: [String] = []
        var UnsortedArraySeptember: [String] = []
        var UnsortedArrayOctober: [String] = []
        var UnsortedArrayNovember: [String] = []
        var UnsortedArrayDecember: [String] = []
        
        
        var x = 0
        
        //Divide the Unsorted Array into their months
        while x != UnsortedArray.count {
            if UnsortedArray[x].contains("Date:January"){
                UnsortedArrayJanuary.append(UnsortedArray[x])
            }
                else if UnsortedArray[x].contains("Date:Februaray"){
                    UnsortedArrayFebruary.append(UnsortedArray[x])
                }
                    else if UnsortedArray[x].contains("Date:March"){
                        UnsortedArrayMarch.append(UnsortedArray[x])
                    }
                        else if UnsortedArray[x].contains("Date:April"){
                            UnsortedArrayApril.append(UnsortedArray[x])
                        }
                            else if UnsortedArray[x].contains("Date:May"){
                                UnsortedArrayMay.append(UnsortedArray[x])
                            }
                                else if UnsortedArray[x].contains("Date:June"){
                                    UnsortedArrayJune.append(UnsortedArray[x])
                                }
                                    else if UnsortedArray[x].contains("Date:July"){
                                        UnsortedArrayJuly.append(UnsortedArray[x])
                                    }
                                        else if UnsortedArray[x].contains("Date:August"){
                                            UnsortedArrayAugust.append(UnsortedArray[x])
                                        }
                                            else if UnsortedArray[x].contains("Date:September"){
                                                UnsortedArraySeptember.append(UnsortedArray[x])
                                            }
                                                else if UnsortedArray[x].contains("Date:October"){
                                                    UnsortedArrayOctober.append(UnsortedArray[x])
                                                }
                                                    else if UnsortedArray[x].contains("Date:November"){
                                                        UnsortedArrayNovember.append(UnsortedArray[x])
                                                    }
                                                        else if UnsortedArray[x].contains("Date:December"){
                                                            UnsortedArrayDecember.append(UnsortedArray[x])
                                                        }
            x = x+1
        }
        
        
        
        //Get current month
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let CurrentMonth = dateFormatter.string(from: now)
        
        //Get current Calendar Day
        
        
        //Check which MonthArray we are using
        if CurrentMonth == "January"{
            
            
        }
            
        
        
        
    }
    
    func SortByDateEvents(){
        let userDefaults = UserDefaults.standard
        
        CheckIfEventArrayEmpty()
        
        let UnsortedArray: [String] = userDefaults.object(forKey: "Event") as? [String] ?? []
        
        //Declaration of the months
        //The UnsortedArray gets divided in the seperate montharrays
        var UnsortedArrayJanuary: [String] = []
        var UnsortedArrayFebruary: [String] = []
        var UnsortedArrayMarch: [String] = []
        var UnsortedArrayApril: [String] = []
        var UnsortedArrayMay: [String] = []
        var UnsortedArrayJune: [String] = []
        var UnsortedArrayJuly: [String] = []
        var UnsortedArrayAugust: [String] = []
        var UnsortedArraySeptember: [String] = []
        var UnsortedArrayOctober: [String] = []
        var UnsortedArrayNovember: [String] = []
        var UnsortedArrayDecember: [String] = []
        
        
        var x = 0
        
        //Divide the Unsorted Array into their months
        while x != UnsortedArray.count {
            if UnsortedArray[x].contains("Date:January"){
                UnsortedArrayJanuary.append(UnsortedArray[x])
            }
                else if UnsortedArray[x].contains("Date:Februaray"){
                    UnsortedArrayFebruary.append(UnsortedArray[x])
                }
                    else if UnsortedArray[x].contains("Date:March"){
                        UnsortedArrayMarch.append(UnsortedArray[x])
                    }
                        else if UnsortedArray[x].contains("Date:April"){
                            UnsortedArrayApril.append(UnsortedArray[x])
                        }
                            else if UnsortedArray[x].contains("Date:May"){
                                UnsortedArrayMay.append(UnsortedArray[x])
                            }
                                else if UnsortedArray[x].contains("Date:June"){
                                    UnsortedArrayJune.append(UnsortedArray[x])
                                }
                                    else if UnsortedArray[x].contains("Date:July"){
                                        UnsortedArrayJuly.append(UnsortedArray[x])
                                    }
                                        else if UnsortedArray[x].contains("Date:August"){
                                            UnsortedArrayAugust.append(UnsortedArray[x])
                                        }
                                            else if UnsortedArray[x].contains("Date:September"){
                                                UnsortedArraySeptember.append(UnsortedArray[x])
                                            }
                                                else if UnsortedArray[x].contains("Date:October"){
                                                    UnsortedArrayOctober.append(UnsortedArray[x])
                                                }
                                                    else if UnsortedArray[x].contains("Date:November"){
                                                        UnsortedArrayNovember.append(UnsortedArray[x])
                                                    }
                                                        else if UnsortedArray[x].contains("Date:December"){
                                                            UnsortedArrayDecember.append(UnsortedArray[x])
                                                        }
            x = x+1
        }
        
        
        
        
    }
    
    
    

    
    
    
    
    
    //TASK PREVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userDefaults = UserDefaults.standard
        
     //   var ReturnCount = 0
        
    //    if tableView == tableViewTASK{
        
           
             
            let myArray: [String] = userDefaults.object(forKey: "Task") as? [String] ?? [] // Set Task for local array
            
            return myArray.count
                
      //  }
    //    else if tableView == tableViewEVENT{
            
   //         if userDefaults.object(forKey: "Event") == nil{ //Check if Array is empty
   //             let FillArray = [""]
      //          userDefaults.set(FillArray, forKey: "Event") //If Array empty then fill with space
    //        }
             
     //       let myArray: [String] = userDefaults.object(forKey: "Event") as? [String] ?? [] // Set Task for local array
            
    //        ReturnCount = myArray.count
     //
    //    }
        
     //   return ReturnCount
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userDefaults = UserDefaults.standard
        
        //declaration
    //    var returnCell = UITableViewCell()
        
     //   if tableView == tableViewTASK{
        
          CheckIfTaskArrayEmpty()
        
          let myArray: [String] = userDefaults.object(forKey: "Task") as? [String] ?? [] // Set Task for local array
        
          let myCell = tableViewTASK.dequeueReusableCell(withIdentifier: "TableViewCellTASK", for: indexPath) as! TableViewCellTASK
        
          myCell.myLabel?.text = myArray[indexPath.row]
          
   //     returnCell = myCell
            
            return myCell
 //   }
  //      else if tableView == tableViewEVENT{
            
  //          if userDefaults.object(forKey: "Event") == nil{ //Check if Array is empty
  //              let FillArray = [""]
  //              userDefaults.set(FillArray, forKey: "Event") //If Array empty then fill with space
  //          }
            
  //          let myArray: [String] = userDefaults.object(forKey: "Event") as? [String] ?? [] // Set Task for local array
          
 //           let myCell = tableViewTASK.dequeueReusableCell(withIdentifier: "TableViewCellEVENT", for: indexPath) as! TableViewCellEVENT
          
 //           myCell.myLabel?.text = myArray[indexPath.row]
            
 //          returnCell = myCell
         
 //       }
        
 //     return returnCell
        
    //}
    
    }
    
    //For Checking if the Array is totaly clean
    func CheckIfTaskArrayEmpty() {
        let userDefaults = UserDefaults.standard
        
        if userDefaults.object(forKey: "Task") == nil{ //Check if Array is empty
            let FillArray = [""]
            userDefaults.set(FillArray, forKey: "Task") //If Array empty then fill with space
        }
    }
    
    //For Checking if the Array is totaly clean
    func CheckIfEventArrayEmpty(){
        let userDefaults = UserDefaults.standard
        
        if userDefaults.object(forKey: "Event") == nil{ //Check if Array is empty
            let FillArray = [""]
            userDefaults.set(FillArray, forKey: "Event") //If Array empty then fill with space
        }
    }
    
    //For Checking if the Array is totaly clean
    func CheckIfDayArrayEmpty(){
        let userDefaults = UserDefaults.standard
        
        if userDefaults.object(forKey: "Day") == nil{ //Check if Array is empty
            let FillArray = [""]
            userDefaults.set(FillArray, forKey: "Day") // If Array empty then fill with space
        }
        
    }
    
    
    
}
