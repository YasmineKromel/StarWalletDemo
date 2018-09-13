//
//  HomeCell.swift
//  StarWalletDemo
//
//  Created by mino on 9/12/18.
//  Copyright © 2018 mino. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var desc: UILabel!
 

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
