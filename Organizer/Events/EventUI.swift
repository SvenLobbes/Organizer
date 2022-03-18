//
//  EventUI.swift
//  Organizer
//
//  Created by Sven Lobbes on 06.07.21.
//

import Foundation
import UIKit


//EventUI
class EventTable: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        
        
        
        //Registration of all TableViewCells
        let StandardCell = UINib(nibName: "TableViewCellEVENT", bundle: nil)
        let BlueCell = UINib(nibName: "TableViewCellEVENTBlue", bundle: nil)
        let RedCell = UINib(nibName: "TableViewCellEVENTRed", bundle: nil)
        let YellowCell = UINib(nibName: "TableViewCellEVENTYellow", bundle: nil)
        let OrangeCell = UINib(nibName: "TableViewCellEVENTOrange", bundle: nil)
        let PurpleCell = UINib(nibName: "TableViewCellEVENTPurple", bundle: nil)
        let GreenCell = UINib(nibName: "TableViewCellEVENTGreen", bundle: nil)
        let BlackCell = UINib(nibName: "TableViewCellEVENTBlack", bundle: nil)
        let GrayCell = UINib(nibName: "TableViewCellEVENTGray", bundle: nil)
                
        tableView.register(StandardCell, forCellReuseIdentifier: "TableViewCellEVENT")
        tableView.register(BlueCell, forCellReuseIdentifier: "TableViewCellEVENTBlue")
        tableView.register(RedCell, forCellReuseIdentifier: "TableViewCellEVENTRed")
        tableView.register(YellowCell, forCellReuseIdentifier: "TableViewCellEVENTYellow")
        tableView.register(OrangeCell, forCellReuseIdentifier: "TableViewCellEVENTOrange")
        tableView.register(PurpleCell, forCellReuseIdentifier: "TableViewCellEVENTPurple")
        tableView.register(GreenCell, forCellReuseIdentifier: "TableViewCellEVENTGreen")
        tableView.register(BlackCell, forCellReuseIdentifier: "TableViewCellEVENTBlack")
        tableView.register(GrayCell, forCellReuseIdentifier: "TableViewCellEVENTGray")
        
        tableView.delegate = self
        tableView.dataSource = self
        
         
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userDefaults = UserDefaults.standard
        
        Home().CheckIfEventArrayEmpty()
        
        let myArray: [String] = userDefaults.object(forKey: "Event") as? [String] ?? [] // Set Task for local array
        
        return myArray.count
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
       if editingStyle == .delete{
           let userDefaults = UserDefaults.standard
           
           Home().CheckIfEventArrayEmpty()
           
            var myArray: [String] = userDefaults.object(forKey: "Event") as? [String] ?? [] // Set Task for local array
           
           myArray.remove(at: indexPath.row)
           tableView.deleteRows(at: [indexPath], with: .fade)
       } else if editingStyle == .insert {
           //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
       }
       
   }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let userDefaults = UserDefaults.standard
        
        //Declaration
        var returnCell = UITableViewCell()
        
        //Check if Array is empty
        Home().CheckIfEventArrayEmpty()
        
        let myArray: [String] = userDefaults.object(forKey: "Event") as? [String] ?? [] // Set Task for locay array
        
      
        
        //Choose Color of TableViewCell
        if myArray[indexPath.row].contains("Color:Standard"){
                    let myCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellEVENT", for: indexPath) as! TableViewCellEVENT
                    myCell.myLabel?.text = myArray[indexPath.row]
                    returnCell = myCell
                }
                
                if myArray[indexPath.row].contains("Color:Blue"){
                    let myCell1 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellEVENTBlue", for: indexPath) as! TableViewCellEVENTBlue
                    myCell1.myLabel?.text = myArray[indexPath.row]
                    returnCell = myCell1
                }
                
                if myArray[indexPath.row].contains("Color:Red"){
                    let myCell2 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellEVENTRed", for: indexPath) as! TableViewCellEVENTRed
                    myCell2.myLabel?.text = myArray[indexPath.row]
                    returnCell = myCell2
                }
                
                if myArray[indexPath.row].contains("Color:Yellow"){
                    let myCell3 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellEVENTYellow", for: indexPath) as! TableViewCellEVENTYellow
                    myCell3.myLabel?.text = myArray[indexPath.row]
                    returnCell = myCell3
                }
                
                if myArray[indexPath.row].contains("Color:Orange"){
                    let myCell4 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellEVENTOrange", for: indexPath) as! TableViewCellEVENTOrange
                    myCell4.myLabel?.text = myArray[indexPath.row]
                    returnCell = myCell4
                }
                
                if myArray[indexPath.row].contains("Color:Purple"){
                    let myCell5 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellEVENTPurple", for: indexPath) as! TableViewCellEVENTPurple
                    myCell5.myLabel?.text = myArray[indexPath.row]
                    returnCell = myCell5
                }
                
                if myArray[indexPath.row].contains("Color:Green"){
                    let myCell6 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellEVENTGreen", for: indexPath) as! TableViewCellEVENTGreen
                    myCell6.myLabel?.text = myArray[indexPath.row]
                    returnCell = myCell6
                }
                
                if myArray[indexPath.row].contains("Color:Black"){
                    let myCell7 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellEVENTBlack", for: indexPath) as! TableViewCellEVENTBlack
                    myCell7.myLabel?.text = myArray[indexPath.row]
                    returnCell = myCell7
                }
                
                if myArray[indexPath.row].contains("Color:Gray"){
                    let myCell8 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellEVENTGray", for: indexPath) as! TableViewCellEVENTGray
                    myCell8.myLabel?.text = myArray[indexPath.row]
                    returnCell = myCell8
                }
        
        return returnCell
    }
    
    //Clear List Button
    @IBAction func ClearListBtn(_ sender: Any) {
        
        //ALERT
        let alert = UIAlertController(title: "Do you want to clear your Events?", message: "By pressing yes, everything gets purged.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            let userDefaults = UserDefaults.standard
            
            var array: [String] = []
            array = userDefaults.object(forKey: "Event") as? [String] ?? [String]()
            
            array.removeAll()
            
            userDefaults.set(array, forKey: "Event")
            
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
        
        
        
    }

    
    
}
