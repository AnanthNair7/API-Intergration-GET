//
//  TableViewCell.swift
//  ApiIntergration
//
//  Created by Ananth Nair on 08/08/23.
//

import UIKit

class TableViewCell: UITableViewCell{

    @IBOutlet weak var lab: UILabel!
    
    
    @IBOutlet weak var lab1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
