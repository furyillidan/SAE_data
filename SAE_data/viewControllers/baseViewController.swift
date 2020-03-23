//
//  baseViewController.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/3/17.
//  Copyright © 2020 Neo Chou. All rights reserved.
//

import UIKit

class baseViewController : UIViewController {
    
    let cellIdIdentifier = "baseTableViewCell"
  
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        
        let label = UILabel()
        label.text = "testr[fjfgldk"
        label.frame = CGRect(x: 10, y: 10, width: 200, height: 80)
        self.view.addSubview(label)

    }

}
