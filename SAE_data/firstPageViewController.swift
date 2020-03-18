//
//  firstPageViewController.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/3/18.
//  Copyright © 2020 Neo Chou. All rights reserved.
//

import UIKit

class firstPageViewController: UIViewController {

    let firstPageTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.firstPageTableView.register(UINib(nibName: firstPageTableViewCell.registerID, bundle: nil), forCellReuseIdentifier: firstPageTableViewCell.registerID)
        self.firstPageTableView.register(UINib(nibName: xibTableViewCell.registerID, bundle: nil), forCellReuseIdentifier: xibTableViewCell.registerID)
        firstPageTableView.frame = CGRect(x: 0, y: 110, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.view.addSubview(firstPageTableView)
        firstPageTableView.delegate = self
        firstPageTableView.dataSource = self
        firstPageTableView.rowHeight = UITableView.automaticDimension
        firstPageTableView.estimatedRowHeight = 80
        firstPageTableView.allowsSelection = false
   
    }
}

extension firstPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row > 2{
          let cell = tableView.dequeueReusableCell(withIdentifier: "firstPageTableViewCell") as! firstPageTableViewCell
              return cell
        }else{
          let cell = tableView.dequeueReusableCell(withIdentifier: "xibTableViewCell") as! xibTableViewCell
              return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
    
}
