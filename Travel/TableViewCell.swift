//
//  CountryTableViewCell.swift
//  Travel
//
//  Created by Chong Ck on 24/01/2020.
//  Copyright © 2020 MAD2. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell : UITableViewCell{
        
    @IBOutlet weak var Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
