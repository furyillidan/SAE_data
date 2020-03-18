//
//  homeCell.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/3/16.
//  Copyright © 2020 Neo Chou. All rights reserved.
//

import UIKit

class homeCell: UITableViewCell {
    
    static var registerID = "homeCell"

    @IBOutlet weak var iconImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}