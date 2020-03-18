//
//  TabViewController.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/3/17.
//  Copyright © 2020 Neo Chou. All rights reserved.
//

import UIKit
import Pageboy
import Tabman

class TabViewController: TabmanViewController {

    var viewControllers = [baseViewController(),UIViewController()]
    var titleNameArr = ["英雄列表","副本遺物","神器收集","時光之巔"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.layout.contentMode = .fit
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        addBar(bar, dataSource: self, at: .top)
    }
    
}

extension TabViewController : PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return self.viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        
        let view = [firstPageViewController(),ViewController2()]
    
        return view[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let title = titleNameArr[index]
        return TMBarItem(title: title)
    }
    
    
}
