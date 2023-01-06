//
//  DataViewController.swift
//  Time Visualizer V2.0
//
//  Created by Aamer Essa on 03/12/2022.
//

import UIKit
import Charts
class ChartsViewController: UIViewController {

    @IBOutlet weak var itemTime: UILabel!
    @IBOutlet weak var tableList: UITableView!
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var lineChart: LineChartView!
    var time = [String]()
    var date: Date = Calendar.current.startOfDay(for: Date());
    var items = [Items]()
    var sortItems = [[String]]()
    var keyWords = [KeyWords]()
    var keywordsValue = [Int]()
    var isHidden = false
    var showDay = false
    override func viewDidLoad() {
        super.viewDidLoad()
        tableList.delegate = self
        tableList.dataSource = self
       
        for _ in 1...48 {
            let timeForematter = DateFormatter()
            timeForematter.dateFormat = "hh:mm a"
            time.append(timeForematter.string(from: date))
            date.addTimeInterval(30 * 60)
        }
        
        for _ in keyWords {
            keywordsValue.append(0)
        }
        lineChart.isHidden = true
        pieChart.isHidden = false
        
        setSortArray()
       check()
        // setup the cahrts
        
        // pie chart
        pieChart.center = view.center
        var entries: [PieChartDataEntry] = Array()

        for counter in 0...keyWords.count-1 {
            entries.append(PieChartDataEntry(value: Double(keywordsValue[counter]), label: keyWords[counter].keyWord! ))
        }

        let dataSet = PieChartDataSet(entries: entries)
        var dataColors = [UIColor]()

        for count in 0...keyWords.count-1 {
            let color = keyWords[count].color!.components(separatedBy: " ")
            dataColors.append( UIColor(cgColor: CGColor(red: Double(color[1])!, green: Double(color[2])!, blue:Double(color[3])!, alpha: 1)))
          
        }
        dataSet.colors = dataColors
        pieChart.data = PieChartData(dataSet: dataSet)
        
        // line chart
        
        lineChart.center = view.center
        var lineEntries: [ChartDataEntry] = Array()
        
        for counter in 0...keyWords.count-1 {
            lineEntries.append(ChartDataEntry(x: Double(counter), y: Double(keywordsValue[counter])))
        }
      
        let lineDataSet = LineChartDataSet(entries: lineEntries)
        lineDataSet.colors = dataColors
        lineChart.data = LineChartData(dataSet: lineDataSet)
        
      
        
        // Do any additional setup after loading the view.
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        let lefttSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        rightSwipe.direction = .left
        view.addGestureRecognizer(lefttSwipe)
        
    }
    
   func setSortArray (){
       let dateFormater = DateFormatter()
       dateFormater.dateFormat = "hh:mm a"
       var sd = [String]()
           
           for times in time {
               for item in items {
               if dateFormater.string(from: item.item_date!) == times {
                   let dateFormaterText = DateFormatter()
                   dateFormaterText.dateFormat = "MMM d"
                   sd.append("\(dateFormaterText.string(from: item.item_date!)) :  \(item.item_name!)")
               }
                
           }//end of for two
               sortItems.append(sd)
               sd.removeAll()
       }//end of for one
       
    }
    
    func check (){
            for item in items {

                let itemName = item.item_name!.components(separatedBy: " ")

                    for counter in 0...keyWords.count-1 {
                        for name in itemName{
                    if name == keyWords[counter].keyWord!{
                        keywordsValue[counter] = keywordsValue[counter] + 1
                    }
                }
            }
        }
        
    }
    
    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer)
    {
        if sender.direction == .right
        {
           dismiss(animated: true)
        }
        
        if sender.direction == .left {
            
            if !pieChart.isHidden {
                
                lineChart.isHidden = false
                pieChart.isHidden = true
            } else{
                lineChart.isHidden = true
                pieChart.isHidden = false
            }
        }
    }
    

    

}

extension ChartsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return time.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableList.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemsTableViewCell_DataView
        
        var pointer = 0
        
        
        cell.itemTimeLabel.text = time[indexPath.row]
        cell.labelOne.text = sortItems[indexPath.row][pointer]
        cell.labelTwo.text = sortItems[indexPath.row][pointer+1]
        cell.labelThree.text = sortItems[indexPath.row][pointer+2]
        cell.labelFour.text = sortItems[indexPath.row][pointer+3]
        cell.labelFive.text = sortItems[indexPath.row][pointer+4]
        cell.labelSix.text = sortItems[indexPath.row][pointer+5]
       cell.labelSeven.text = sortItems[indexPath.row][pointer+6]
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
}
