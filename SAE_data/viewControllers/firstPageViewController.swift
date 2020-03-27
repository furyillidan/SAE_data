//
//  firstPageViewController.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/3/18.
//  Copyright © 2020 Neo Chou. All rights reserved.
//

import UIKit

class firstPageViewController: UIViewController {

    let firstPageTableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
    var pageIndex = 0
    var heroListDataArray : HeroListDataModel?
    var bloodHeroData : [HeroData]?
    var deadHeroData : [HeroData]?
    var demonHeroData : [HeroData]?
    var geHeroData : [HeroData]?
    var greenHeroData : [HeroData]?
    var helfGodHeroData : [HeroData]?
    var netherguestHeroData : [HeroData]?
    var serviceGroup = DispatchGroup()
    var allHeroNameArray = [String]()
    var allHeroLevelArray = [String]()
    var allHeroTypeArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.load_Data()
        self.setUpTableView()
   
    }
    
    func setUpTableView() {
        
        self.firstPageTableView.register(UINib(nibName: firstPageTableViewCell.registerID, bundle: nil), forCellReuseIdentifier: firstPageTableViewCell.registerID)
        firstPageTableView.frame = CGRect(x: 0, y: 110, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.view.addSubview(firstPageTableView)
        firstPageTableView.delegate = self
        firstPageTableView.dataSource = self
        firstPageTableView.rowHeight = UITableView.automaticDimension
        firstPageTableView.estimatedRowHeight = 80
        firstPageTableView.allowsSelection = false
     
    }
    
    func load_Data () {

        self.serviceGroup.enter()
        let service = Service()
        service.delegate = self
        service.requestCoverData()
        
        
        self.serviceGroup.notify(queue: .main) {
            self.firstPageTableView.reloadData()
        }
    }
    
    
}

extension firstPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let textlabel = UILabel()
        textlabel.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 60)
        textlabel.font = UIFont(name: "Helvetica-Bold", size: 25)
        textlabel.textAlignment = .natural
        headerView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        headerView.addSubview(textlabel)
        switch section {
        case 0:
            textlabel.text = HERO_RACE_LIST_CT[0]
        case 1:
            textlabel.text = HERO_RACE_LIST_CT[1]
        case 2:
            textlabel.text = HERO_RACE_LIST_CT[2]
        case 3:
            textlabel.text = HERO_RACE_LIST_CT[3]
        case 4:
            textlabel.text = HERO_RACE_LIST_CT[4]
        case 5:
            textlabel.text = HERO_RACE_LIST_CT[5]
        case 6:
            textlabel.text = HERO_RACE_LIST_CT[6]
        default:
            break
        }
        return headerView
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return HERO_RACE_LIST_CT.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return geHeroData?.count ?? 0
        case 1:
            return bloodHeroData?.count ?? 0
        case 2:
            return greenHeroData?.count ?? 0
        case 3:
            return deadHeroData?.count ?? 0
        case 4:
            return demonHeroData?.count ?? 0
        case 5:
            return helfGodHeroData?.count ?? 0
        case 6:
            return netherguestHeroData?.count ?? 0
        default:
            break
        }
        return HERO_RACE_LIST_CT.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
          let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_NAME_FIRSTPAGE_CELL) as! firstPageTableViewCell
         switch indexPath.section {
         case 0:
            for i in self.helfGodHeroData! {
                cell.nameLabel.text = i.name
                cell.levelLabel.text = i.positioning
                cell.typeLabel.text = i.firstdraw
            }
         default:
            break
        }

          return cell
       }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
    
    private func cellData (name:String, level:String, type:String, cell:firstPageTableViewCell) -> UITableViewCell {
        
        cell.levelLabel.text = level
        cell.nameLabel.text = name
        cell.typeLabel.text = type
        return cell
    }
        
}

extension firstPageViewController: ServiceDelegate {

    func requestCoverDataResult(_result: HeroListDataModel?) {

        
        self.heroListDataArray = _result
        self.bloodHeroData = _result?.blood
        self.deadHeroData = _result?.dead
        self.demonHeroData = _result?.demon
        self.greenHeroData = _result?.green
        self.geHeroData = _result?.ge
        self.helfGodHeroData = _result?.helfgod
        self.netherguestHeroData = _result?.netherguest
        
        for i in geHeroData! {
            allHeroNameArray.append(i.name!)
            allHeroTypeArray.append(i.positioning!)
            allHeroLevelArray.append(i.firstdraw!)
        }
        for i in bloodHeroData! {
            allHeroNameArray.append(i.name!)
        }
        for i in greenHeroData! {
            allHeroNameArray.append(i.name!)
        }
        for i in deadHeroData! {
            allHeroNameArray.append(i.name!)
        }
        for i in helfGodHeroData! {
            allHeroNameArray.append(i.name!)
        }
        for i in demonHeroData! {
            allHeroNameArray.append(i.name!)
        }
        for i in netherguestHeroData! {
            allHeroNameArray.append(i.name!)
        }
        print(allHeroNameArray)
        print(allHeroNameArray.count)
        self.serviceGroup.leave()
    }
}

