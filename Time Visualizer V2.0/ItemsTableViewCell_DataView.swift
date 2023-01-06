//
//  ItemsTableViewCell_DataView.swift
//  Time Visualizer V2.0
//
//  Created by Aamer Essa on 03/12/2022.
//

import UIKit

class ItemsTableViewCell_DataView: UITableViewCell {

    @IBOutlet weak var itemTimeLabel: UILabel!
    
    @IBOutlet weak var labelSeven: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelOne: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
