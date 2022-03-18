//
//  TaskUI.swift
//  Organizer
//
//  Created by Sven Lobbes on 06.07.21.
//

import Foundation
import UIKit


//TaskUI
class TaskTable: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad(){
    
        
        super.viewDidLoad()
        
        
        let StandardCell = UINib(nibName: "TableViewCellTASK", bundle: nil)
        let BlueCell = UINib(nibName: "TableViewCellTASKBlue", bundle: nil)
        let RedCell = UINib(nibName: "TableViewCellTASKRed", bundle: nil)
        let YellowCell = UINib(nibName: "TableViewCellTASKYellow", bundle: nil)
        let OrangeCell = UINib(nibName: "TableViewCellTASKOrange", bundle: nil)
        let PurpleCell = UINib(nibName: "TableViewCellTASKPurple", bundle: nil)
        let GreenCell = UINib(nibName: "TableViewCellTASKGreen", bundle: nil)
        let BlackCell = UINib(nibName: "TableViewCellTASKBlack", bundle: nil)
        let GrayCell = UINib(nibName: "TableViewCellTASKGray", bundle: nil)
        
        tableView.register(StandardCell, forCellReuseIdentifier: "TableViewCellTASK")
        tableView.register(BlueCell, forCellReuseIdentifier: "TableViewCellTASKBlue")
        tableView.register(RedCell, forCellReuseIdentifier: "TableViewCellTASKRed")
        tableView.register(YellowCell, forCellReuseIdentifier: "TableViewCellTASKYellow")
        tableView.register(OrangeCell, forCellReuseIdentifier: "TableViewCellTASKOrange")
        tableView.register(PurpleCell, forCellReuseIdentifier: "TableViewCellTASKPurple")
        tableView.register(GreenCell, forCellReuseIdentifier: "TableViewCellTASKGreen")
        tableView.register(BlackCell, forCellReuseIdentifier: "TableViewCellTASKBlack")
        tableView.register(GrayCell, forCellReuseIdentifier: "TableViewCellTASKGray")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func SortList(_ sender: Any) {
    }
    
    
    //FUNCS FOR TABLEVIEW
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userDefaults = UserDefaults.standard
       
        
        Home().CheckIfTaskArrayEmpty()
     //   if userDefaults.object(forKey: "Task") == nil{ //Check if Array is empty
     //   let FillArray = [""]
     //       userDefaults.set(FillArray, forKey: "Task") //If Array empty then fill with space
     //   }
        
        let myArray: [String] = userDefaults.object(forKey: "Task") as? [String] ?? [] // Set Task for local array
        
        return myArray.count
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            let userDefaults = UserDefaults.standard
            
            Home().CheckIfTaskArrayEmpty()
            
             var myArray: [String] = userDefaults.object(forKey: "Task") as? [String] ?? [] // Set Task for local array
            
            myArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userDefaults = UserDefaults.standard
        
   //     //Check if nil and in case replace with "normal"
   //     if userDefaults.object(forKey: "DISPLAYMODETASK") == nil{
     //      userDefaults.set("Normal", forKey: "UserName")
      //  }
        
        
    //    let DISPLAYMODESTRING = userDefaults.object(forKey: "DISPLAYMODETASK") as? String // GET Sorted DisplayMode
        
        
        
   //     if DISPLAYMODESTRING == "Normal"{
            
           //Declaration
           var returnCell = UITableViewCell()
        
            Home().CheckIfTaskArrayEmpty()
        
            let myArray: [String] = userDefaults.object(forKey: "Task") as? [String] ?? [] // Set Task for local array
        
           //Choose Color of TableViewCell
           if myArray[indexPath.row].contains("Color:Standard"){
               let myCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTASK", for: indexPath) as! TableViewCellTASK
               myCell.myLabel?.text = myArray[indexPath.row]
               returnCell = myCell
           }
        
           if myArray[indexPath.row].contains("Color:Blue"){
               let myCell1 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTASKBlue", for: indexPath) as! TableViewCellTASKBlue
               myCell1.myLabel?.text = myArray[indexPath.row]
               returnCell = myCell1
           }
        
           if myArray[indexPath.row].contains("Color:Red"){
               let myCell2 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTASKRed", for: indexPath) as! TableViewCellTASKRed
               myCell2.myLabel?.text = myArray[indexPath.row]
               returnCell = myCell2
           }
        
           if myArray[indexPath.row].contains("Color:Yellow"){
               let myCell3 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTASKYellow", for: indexPath) as! TableViewCellTASKYellow
               myCell3.myLabel?.text = myArray[indexPath.row]
               returnCell = myCell3
           }
        
           if myArray[indexPath.row].contains("Color:Orange"){
               let myCell4 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTASKOrange", for: indexPath) as! TableViewCellTASKOrange
               myCell4.myLabel?.text = myArray[indexPath.row]
               returnCell = myCell4
           }
        
           if myArray[indexPath.row].contains("Color:Purple"){
               let myCell5 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTASKPurple", for: indexPath) as! TableViewCellTASKPurple
               myCell5.myLabel?.text = myArray[indexPath.row]
               returnCell = myCell5
           }
        
           if myArray[indexPath.row].contains("Color:Green"){
               let myCell6 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTASKGreen", for: indexPath) as! TableViewCellTASKGreen
               myCell6.myLabel?.text = myArray[indexPath.row]
               returnCell = myCell6
           }
        
           if myArray[indexPath.row].contains("Color:Black"){
               let myCell7 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTASKBlack", for: indexPath) as! TableViewCellTASKBlack
               myCell7.myLabel?.text = myArray[indexPath.row]
               returnCell = myCell7
           }
        
           if myArray[indexPath.row].contains("Color:Gray"){
               let myCell8 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTASKGray", for: indexPath) as! TableViewCellTASKGray
               myCell8.myLabel?.text = myArray[indexPath.row]
               returnCell = myCell8
           }
        
           return returnCell
        }
        
        //   else if DISPLAYMODESTRING == "SortBySubject"{
            
           
            
            
            
            
     //   }
        
        
        
//    }
    
    
    
    
    
    
    
    
    
    //Clear List Button
    @IBAction func ClearListbtn(_ sender: Any) {
        
        //ALERT
        let alert = UIAlertController(title: "Do you want to clear your Tasks?", message: "By pressing yes, everything gets purged.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            let userDefaults = UserDefaults.standard
            
            var array: [String] = []
            array = userDefaults.object(forKey: "Task") as? [String] ?? [String]()
            array.removeAll() //Purge whole array
            userDefaults.set(array, forKey: "Task") // Save to UserDefaults
            
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
        
    }
    
    @IBAction func SortBySubject(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        
        Home().CheckIfTaskArrayEmpty()
        
        //SET DISPLAYMODE
        userDefaults.set("SortBySubject", forKey: "DISPLAYMODETASK")
        
        
        let myArray: [String] = userDefaults.object(forKey: "Task") as? [String] ?? [] // Set Task for local array
        
        var i = 0 //var for out loop
        let len = myArray.count
        var CLEANmyArray: [String] = []
        
        
        while(i != len){
            if myArray[i].contains("Color:Gray"){
                CLEANmyArray.append(myArray[i])
            }
            i=i+1
        }
        i = 0
        
        while(i != len){
            if myArray[i].contains("Color:Black"){
                CLEANmyArray.append(myArray[i])
            }
            i=i+1
        }
        i = 0
        
        while(i != len){
            if myArray[i].contains("Color:Green"){
                CLEANmyArray.append(myArray[i])
            }
            i=i+1
        }
        i = 0
        
        while(i != len){
            if myArray[i].contains("Color:Purple"){
                CLEANmyArray.append(myArray[i])
            }
            i=i+1
        }
        i = 0
        
        while(i != len){
            if myArray[i].contains("Color:Orange"){
                CLEANmyArray.append(myArray[i])
            }
            i=i+1
        }
        i = 0
        
        while(i != len){
            if myArray[i].contains("Color:Yellow"){
                CLEANmyArray.append(myArray[i])
            }
            i=i+1
        }
        i = 0
        
        while(i != len){
            if myArray[i].contains("Color:Red"){
                CLEANmyArray.append(myArray[i])
            }
            i=i+1
        }
        i = 0
        
        while(i != len){
            if myArray[i].contains("Color:Blue"){
                CLEANmyArray.append(myArray[i])
            }
            i=i+1
        }
        i = 0
        
        
        
        userDefaults.set(CLEANmyArray, forKey: "TaskSortBySubject" )
        
    }
    
    
    
    
    
    
    
    
    
}



