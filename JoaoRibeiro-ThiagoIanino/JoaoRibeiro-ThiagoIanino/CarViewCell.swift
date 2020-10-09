//
//  CarViewCell.swift
//  JoaoRibeiro-ThiagoIanino
//
//  Created by andre on 09/10/20.
//  Copyright © 2020 joao. All rights reserved.
//

import UIKit

class CarViewCell: UITableViewCell {
    
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carBrand: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
