//
//  ArtifacDataTableViewCell.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/4/7.
//  Copyright © 2020 Neo Chou. All rights reserved.
//

import UIKit

class ArtifacDataTableViewCell: UITableViewCell {
    
    static var registerID = "ArtifacDataTableViewCell"

    @IBOutlet weak var artifacIcon: UIImageView!
    @IBOutlet weak var artifacNameLabel: UILabel!
    @IBOutlet weak var getwayLabel: UILabel!
    @IBOutlet weak var effectLabel: UILabel!
    @IBOutlet weak var attributesLabel: UILabel!
    @IBOutlet weak var suggestLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
