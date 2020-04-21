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
    
    var titleNameArr = ["英雄列表","副本遺物","神器收集","時光之巔","推薦資源區"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        let bar = TMBar.ButtonBar()
        bar.buttons.customize { (button) in
            button.tintColor = UIColor(red: 0.3, green: 0.3, blue: 1, alpha: 0.5)
            button.selectedTintColor = .orange
            button.backgroundColor = UIColor(red: 1, green: 0.5, blue: 0.5, alpha: 0.05)
        }
        bar.layout.transitionStyle = .snap
        bar.layout.contentMode = .intrinsic
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        addBar(bar, dataSource: self, at: .top)
    }
    
}

extension TabViewController : PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return self.titleNameArr.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        
         let vc = UIStoryboard(name: STORYBOARD_NAME_MAIN, bundle: nil).instantiateViewController(withIdentifier: IDENTIFIER_NAME_FIRSTPAGE) as! firstPageViewController
        
        switch index {
        case 0:
            vc.pageIndex = 0
            return vc
        case 1:
            vc.pageIndex = 1
            return vc
        case 2:
            vc.pageIndex = 2
            return vc
        case 3:
            vc.pageIndex = 3
            return vc
        case 4:
            let vc = UIStoryboard(name: STORYBOARD_NAME_MAIN, bundle: nil).instantiateViewController(withIdentifier: IDENTIFIER_NAME_RECOMMENDEDVIEW_CONTROLLER) as! RecommendedViewController
            return vc
        default:
            return vc
        }
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let title = titleNameArr[index]
        return TMBarItem(title: title)
    }
    
    
}
