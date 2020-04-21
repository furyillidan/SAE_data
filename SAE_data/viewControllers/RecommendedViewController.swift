//
//  RecommendedViewController.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/4/7.
//  Copyright © 2020 Neo Chou. All rights reserved.
//

import UIKit

class RecommendedViewController: UIViewController {
    
    let RecommendedTableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
    
    let RecommendedName = ["劍與遠征巴哈討論版","劍與遠征官方FB","TapTap | 發現好遊戲","Gamertb玩家部落"]
    let RecommendedLink = ["https://forum.gamer.com.tw/A.php?bsn=36833","https://www.facebook.com/groups/473638513212123/","https://www.taptap.com/app/137515","https://www.gamertb.com/arena/home/"]

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
        
    }
    
    
    func setUpTableView() {
        
        self.RecommendedTableView.register(UINib(nibName: RecommendedTableViewCell.registerID, bundle: nil), forCellReuseIdentifier: RecommendedTableViewCell.registerID)
        RecommendedTableView.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 70)
        self.view.addSubview(RecommendedTableView)
        RecommendedTableView.delegate = self
        RecommendedTableView.dataSource = self
        RecommendedTableView.rowHeight = UITableView.automaticDimension
        RecommendedTableView.estimatedRowHeight = 80
//        RecommendedTableView.isUserInteractionEnabled = true
    }
    
}


extension RecommendedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecommendedLink.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_NAME_RECOMMENDEDTABLEVIEW_CELL) as! RecommendedTableViewCell
        cell.linkLabel.textColor = .blue
        cell.linkLabel.text = RecommendedName[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: STORYBOARD_NAME_MAIN, bundle: nil).instantiateViewController(withIdentifier: IDENTIFIER_NAME_WEBVIEWVIEW_CONTROLLER) as! WebViewViewController
        vc.urlString = RecommendedLink[indexPath.row]
        self.present(vc, animated: true, completion: nil)
        
    }
    
}
