//
//  ItemTableViewCell.swift
//  Time Visualizer V2.0
//
//  Created by Aamer Essa on 03/12/2022.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemTitleTextField: UITextField!
    @IBOutlet weak var itemTime: UILabel!
    var destination = Int()
    var item:operations?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemTime.textColor = .white
        itemTitleTextField.textColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func itemName(_ sender: UITextField) {
        item?.addNewItem(name: sender.text!,destination: destination)
       
    }
}
