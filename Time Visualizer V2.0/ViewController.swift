//
//  ViewController.swift
//  Time Visualizer V2.0
//
//  Created by Aamer Essa on 02/12/2022.
//

import UIKit
import CoreData
protocol operations {
    func addNewItem(name:String, destination:Int )
    func addKeyword(name:String,color:String)
}

class ViewController: UIViewController,operations {
 

    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext // connect to DB
    
    
    @IBOutlet weak var Days: UIPickerView!
    @IBOutlet weak var itemsList: UITableView!
    var items = [Items]()
    var keyword = [KeyWords]()
    var days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
   
    var selectedDay = "Sunday"
    var itemList = [Items]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        fetchAllTasks()
        if items.count <= 0 {
            createWeek()
            fetchAllTasks()
        }
        
        
        
        Days.dataSource = self
        Days.delegate = self
        itemsList.delegate = self
        itemsList.dataSource = self
        
      
    // setup swipe
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
         let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
         
         leftSwipe.direction = .left
         rightSwipe.direction = .right

         view.addGestureRecognizer(leftSwipe)
         view.addGestureRecognizer(rightSwipe)
     }

    
    func createWeek(){
        
       
        let cureentDayFormatter = DateFormatter()
        let dateComponent = DateComponents()
        cureentDayFormatter.dateFormat = "EEEE"
        let cureentDay = cureentDayFormatter.string(from: Date())
        
        if cureentDay == "Sunday"{
            
            var startOfDay: Date = Calendar.current.startOfDay(for: Date());
           
            for _ in 1...7 {
                    for _ in 1...48 {
                        let newItem = Items(context: managedObjectContext)
                        newItem.item_name = ""
                        newItem.item_date = startOfDay
                        
                        do {
                            try managedObjectContext.save()
                            items.append(newItem)
                        } catch {
                            print("\(error)")
                        }
                        startOfDay = startOfDay.addingTimeInterval(30 * 60)
                    }
                    let futureDate = Calendar.current.date(byAdding: dateComponent, to: startOfDay)
                    startOfDay = futureDate!
            }
            
        } else if cureentDay == "Monday"{
            
            // setup to the first day of the week
            let currentDate = Date()
            var dateComponent = DateComponents()
            dateComponent.day = -1
           let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
            var startOfDay: Date = Calendar.current.startOfDay(for: futureDate!);
            
            
            // crete the list
            for _ in 1...7 {
                let dateComponent = DateComponents()
                    for _ in 1...48 {
                        let newItem = Items(context: managedObjectContext)
                        newItem.item_name = ""
                        newItem.item_date = startOfDay
                        
                        do {
                            try managedObjectContext.save()
                            items.append(newItem)
                        } catch {
                            print("\(error)")
                        }
                        startOfDay = startOfDay.addingTimeInterval(30 * 60)
                    }
                    let futureDate = Calendar.current.date(byAdding: dateComponent, to: startOfDay)
                    startOfDay = futureDate!
            } // end of setup of the list
        }
        
        else if cureentDay == "Tuesday"{
            
            // setup to the first day of the week
            let currentDate = Date()
            var dateComponent = DateComponents()
            dateComponent.day = -2
           let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
            var startOfDay: Date = Calendar.current.startOfDay(for: futureDate!);
            
            // crete the list
            for _ in 1...7 {
                let dateComponent = DateComponents()
                    for _ in 1...48 {
                        let newItem = Items(context: managedObjectContext)
                        newItem.item_name = ""
                        newItem.item_date = startOfDay
                        
                        do {
                            try managedObjectContext.save()
                            items.append(newItem)
                        } catch {
                            print("\(error)")
                        }
                        startOfDay = startOfDay.addingTimeInterval(30 * 60)
                    }
                    let futureDate = Calendar.current.date(byAdding: dateComponent, to: startOfDay)
                    startOfDay = futureDate!
            } // end of setup of the list
        }
        
        else if cureentDay == "Wednesday"{
            
            // setup to the first day of the week
            let currentDate = Date()
            var dateComponent = DateComponents()
            dateComponent.day = -3
           let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
            var startOfDay: Date = Calendar.current.startOfDay(for: futureDate!);
           
            // crete the list
            for _ in 1...7 {
                let dateComponent = DateComponents()
                    for _ in 1...48 {
                        let newItem = Items(context: managedObjectContext)
                        newItem.item_name = ""
                        newItem.item_date = startOfDay
                        
                        do {
                            try managedObjectContext.save()
                            items.append(newItem)
                        } catch {
                            print("\(error)")
                        }
                        startOfDay = startOfDay.addingTimeInterval(30 * 60)
                    }
                    let futureDate = Calendar.current.date(byAdding: dateComponent, to: startOfDay)
                    startOfDay = futureDate!
            } // end of setup of the list
            
        }
        
        else if cureentDay == "Thursday"{
            
            // setup to the first day of the week
            let currentDate = Date()
            var dateComponent = DateComponents()
            dateComponent.day = -4
           let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
            var startOfDay: Date = Calendar.current.startOfDay(for: futureDate!);
            
            // crete the list
            for _ in 1...7 {
                let dateComponent = DateComponents()
                    for _ in 1...48 {
                        let newItem = Items(context: managedObjectContext)
                        newItem.item_name = ""
                        newItem.item_date = startOfDay
                        
                        do {
                            try managedObjectContext.save()
                            items.append(newItem)
                        } catch {
                            print("\(error)")
                        }
                        startOfDay = startOfDay.addingTimeInterval(30 * 60)
                    }
                    let futureDate = Calendar.current.date(byAdding: dateComponent, to: startOfDay)
                    startOfDay = futureDate!
            } // end of setup of the list
            
            
        }
        else if cureentDay == "Friday"{
            
            // setup to the first day of the week
            let currentDate = Date()
            var dateComponent = DateComponents()
            dateComponent.day = -5
           let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
            var startOfDay: Date = Calendar.current.startOfDay(for: futureDate!);
           
            // crete the list
            for _ in 1...7 {
                let dateComponent = DateComponents()
                    for _ in 1...48 {
                        let newItem = Items(context: managedObjectContext)
                        newItem.item_name = ""
                        newItem.item_date = startOfDay
                        
                        do {
                            try managedObjectContext.save()
                            items.append(newItem)
                        } catch {
                            print("\(error)")
                        }
                        startOfDay = startOfDay.addingTimeInterval(30 * 60)
                    }
                    let futureDate = Calendar.current.date(byAdding: dateComponent, to: startOfDay)
                    startOfDay = futureDate!
            } // end of setup of the list
            
        }
        else if cureentDay == "Saturday"{
            // setup to the first day of the week
            let currentDate = Date()
            var dateComponent = DateComponents()
            dateComponent.day = -6
            let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
            var startOfDay: Date = Calendar.current.startOfDay(for: futureDate!);
            
            // crete the list
            for _ in 1...7 {
                let dateComponent = DateComponents()
                    for _ in 1...48 {
                        let newItem = Items(context: managedObjectContext)
                        newItem.item_name = ""
                        newItem.item_date = startOfDay
                        
                        do {
                            try managedObjectContext.save()
                            items.append(newItem)
                        } catch {
                            print("\(error)")
                        }
                        startOfDay = startOfDay.addingTimeInterval(30 * 60)
                    }
                    let futureDate = Calendar.current.date(byAdding: dateComponent, to: startOfDay)
                    startOfDay = futureDate!
            } // end of setup of the list
        }
       
        

    } // end of create week()
    
   
     @objc func handleSwipes(_ sender: UISwipeGestureRecognizer)
     {
         if sender.direction == .left
         {
             
             if self.keyword.isEmpty {
                 let keywordsAlert = UIAlertController(title: "Add Keyword", message: "Sorry you nedd to add Keywords First", preferredStyle: .alert)
                 keywordsAlert.addAction(UIAlertAction(title: "Ok", style: .cancel))
                 self.present(keywordsAlert, animated: true)
             } else{
                 
                 let stroyBoard = UIStoryboard(name: "Main", bundle: nil)
                 let chartsView = stroyBoard.instantiateViewController(withIdentifier: "ChartsView") as! ChartsViewController
                 chartsView.items = items
                 chartsView.keyWords = keyword
                 chartsView.modalPresentationStyle = .fullScreen
                 present(chartsView, animated: true)
             }}

         if sender.direction == .right
         {
             let stroyBoard = UIStoryboard(name: "Main", bundle: nil)
             let keywordView = stroyBoard.instantiateViewController(withIdentifier: "Week") as! KeywordsViewController
             keywordView.keywords = keyword 
             keywordView.modalPresentationStyle = .fullScreen
             present(keywordView, animated: true)
         }
      
       
    }
    
    @IBAction func showListOfBtns(_ sender: Any) {
        let alert = UIAlertController(title: "Start New Week?", message: "Choose to start a new week and remove data from the previous one ", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Add Kewords", style: .default,handler: { handler in
            
           let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let addKeyWords = storyBoard.instantiateViewController(withIdentifier: "AddKeywordsView") as! AddNewKeywordViewController
            addKeyWords.keywords = self
            addKeyWords.modalPresentationStyle = .formSheet 
            self.present(addKeyWords, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Go Back", style: .default))
        alert.addAction(UIAlertAction(title: "Add New Week", style: .destructive,handler: { handler in
            
            let deleteAllItems = NSFetchRequest<NSFetchRequestResult>(entityName: "Items")
            let deleteAllKeyWords = NSFetchRequest<NSFetchRequestResult>(entityName: "KeyWords")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteAllItems)
            let deleteRequestKeywords = NSBatchDeleteRequest(fetchRequest: deleteAllKeyWords)
                   
                   do {
                       try self.managedObjectContext.execute(deleteRequest)


                   } catch {
                        print ("There was an error")
                           }
            
            do{
                try self.managedObjectContext.execute(deleteRequestKeywords)
                
            } catch {
                print("\(error)")
            }
            
            
            self.items.removeAll()
            self.keyword.removeAll()
            self.itemList.removeAll()
            self.createWeek()
            self.fetchAllTasks()
            
        }))
        present(alert, animated: true)
    }
    
    
    func addNewItem(name: String, destination:Int) {
       let newItem = itemList[destination]
        newItem.item_name = name
        
        do {
            try managedObjectContext.save()
            
        } catch {
            print("\(error)")
        }
        itemsList.reloadData()
    } // add new Item
    
    func addKeyword(name: String, color: String) {
        let newKeyword = KeyWords(context: managedObjectContext)
        newKeyword.color = color
        newKeyword.keyWord = name
        
        do{
            try managedObjectContext.save()
            keyword.append(newKeyword)
        } catch{
            print("\(error)")
        }
        dismiss(animated: true)
    }
    
    func fetchAllTasks (){
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Items")
      let keywordsRequest =  NSFetchRequest<NSFetchRequestResult>(entityName: "KeyWords")
        do{
            let resualt = try managedObjectContext.fetch(request)
           let keywordsResualt = try managedObjectContext.fetch(keywordsRequest)
            
            items = resualt as! [Items]
            keyword = keywordsResualt as! [KeyWords]
        } catch {
            print("\(error)")
        }
       
        itemList.removeAll()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "EEEE"
        itemList.removeAll()
        
        
        if selectedDay == "Sunday" {
            for item in items {
                if dateFormatter.string(from: item.item_date!) == "Sunday" {
                    itemList.append(item)
                }
            }
        }
        else if selectedDay == "Monday"{
            
            for item in items {
                if dateFormatter.string(from: item.item_date!) == "Monday" {
                    itemList.append(item)
                }
            }
        }
      
        else if selectedDay == "Tuesday"{
            
            for item in items {
                if dateFormatter.string(from: item.item_date!) == "Tuesday" {
                    itemList.append(item)
                }
            }
            
        }
        
        else if selectedDay == "Wednesday"{
            
            for item in items {
                if dateFormatter.string(from: item.item_date!) == "Wednesday" {
                    itemList.append(item)
                }
            }
            
        }
        
        else if selectedDay == "Thursday"{
            
            for item in items {
                if dateFormatter.string(from: item.item_date!) == "Thursday" {
                    itemList.append(item)
                }
            }
            
        }
        
        else if selectedDay == "Friday"{
            
            for item in items {
                if dateFormatter.string(from: item.item_date!) == "Friday" {
                    itemList.append(item)
                }
            }
            
        }
        
        else if selectedDay == "Saturday"{
            
            for item in items {
                if dateFormatter.string(from: item.item_date!) == "Saturday" {
                    itemList.append(item)
                }
            }
            
        }
        
        itemsList.reloadData()
    }
}

extension ViewController: UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = itemsList.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemTableViewCell
        cell.item = self

        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm a"
        cell.itemTime.text = timeFormatter.string(from: itemList[indexPath.row].item_date!)
        cell.itemTitleTextField.text = itemList[indexPath.row].item_name
        cell.destination = indexPath.row
    
        return cell 
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return days[row]
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        return NSAttributedString(string: days[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDay = days[row]
        fetchAllTasks()
    }
    
    
}
