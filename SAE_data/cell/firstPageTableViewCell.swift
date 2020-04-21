//
//  firstPageTableViewCell.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/3/18.
//  Copyright © 2020 Neo Chou. All rights reserved.
//

import UIKit

class firstPageTableViewCell: UITableViewCell {
    
    static var registerID = "firstPageTableViewCell"

    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var objectLabel: UILabel!
    @IBOutlet weak var featuresLabel: UILabel!
    
    @IBOutlet weak var iconWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var nameLabelConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
