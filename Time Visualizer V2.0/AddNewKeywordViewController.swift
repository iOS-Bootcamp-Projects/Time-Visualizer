//
//  AddNewKeywordViewController.swift
//  Time Visualizer V2.0
//
//  Created by Aamer Essa on 03/12/2022.
//

import UIKit

class AddNewKeywordViewController: UIViewController {

    @IBOutlet weak var keyword: UITextField!
    @IBOutlet weak var keywordColor: UIColorWell!
    
    var keywords:operations?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onClickAddKeyword(_ sender: Any) {
        
        let color = "\(keywordColor.selectedColor!)"
        keywords?.addKeyword(name: keyword.text!, color: color)
        print(keywordColor.selectedColor!)
        
    }
    
}
