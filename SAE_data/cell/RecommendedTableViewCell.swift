//
//  RecommendedTableViewCell.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/4/8.
//  Copyright © 2020 Neo Chou. All rights reserved.
//

import UIKit

class RecommendedTableViewCell: UITableViewCell {
    
    static var registerID = "RecommendedTableViewCell"

    @IBOutlet weak var linkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
