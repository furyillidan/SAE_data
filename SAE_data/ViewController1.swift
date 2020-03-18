//
//  ViewController1.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/3/18.
//  Copyright © 2020 Neo Chou. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let lab = UILabel()
        lab.frame = CGRect(x: 50, y: 50, width: 150, height: 150)
        lab.text = "wdfffadfdafasfadfa"
        self.view.addSubview(lab)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
