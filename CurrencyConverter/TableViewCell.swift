//
//  TableViewCell.swift
//  CurrencyConverter
//
//  Created by Milica Kostic on 4/6/18.
//  Copyright © 2018 Milica Kostic. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    //MK: Properties
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
