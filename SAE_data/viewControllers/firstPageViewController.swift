//
//  firstPageViewController.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/3/18.
//  Copyright © 2020 Neo Chou. All rights reserved.
//

import UIKit
import Kingfisher

class firstPageViewController: UIViewController {

    let firstPageTableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
    var pageIndex = 0
    var heroListDataArray : HeroListDataModel?
    var raidBuffDataArray : [RaidRelicDataModel]?
    var artifacDataArray : [ArtifactDataModel]?
    
    var bloodHeroData : [HeroData]?
    var deadHeroData : [HeroData]?
    var demonHeroData : [HeroData]?
    var geHeroData : [HeroData]?
    var greenHeroData : [HeroData]?
    var helfGodHeroData : [HeroData]?
    var netherguestHeroData : [HeroData]?
    
    var topOfTimeData : [HeroData]?
    
    var serviceGroup = DispatchGroup()
    var allHeroNameArray = [String]()
    var allHeroLevelArray = [String]()
    var allHeroTypeArray = [String]()
    var heroIntroArray : [AllHeroDataListModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.load_Data()
        self.setUpTableView()
   
    }
    
    func setUpTableView() {
        
        var tableViewY:CGFloat = 100
        var heightBotton:CGFloat = 70
        
        if pageIndex == 1 {
            
            let recommendlLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: 50))
            recommendlLabel.text = "推薦度"
            recommendlLabel.textAlignment = .center
            recommendlLabel.backgroundColor = recommendTitleBackColor

            let nameLabel = UILabel(frame: CGRect(x: recommendlLabel.bounds.maxX + 5 , y: 0, width: 70, height: 50))
            nameLabel.text = "名稱"
            nameLabel.textAlignment = .center
            nameLabel.backgroundColor = recommendTitleBackColor
            
            let effectLabel = UILabel(frame: CGRect(x: nameLabel.bounds.maxX + 135, y: 0, width: 100, height: 50))
            effectLabel.text = "效果"
            effectLabel.textAlignment = .center
            effectLabel.backgroundColor = recommendTitleBackColor
            
            let titleView = UIView(frame: CGRect(x: 0, y: 110, width: UIScreen.main.bounds.width, height: 50))
            tableViewY = 160
            heightBotton = 130
            titleView.backgroundColor = recommendTitleBackColor
            
            titleView.addSubview(effectLabel)
            titleView.addSubview(recommendlLabel)
            titleView.addSubview(nameLabel)
            self.view.addSubview(titleView)
            
        }
        
        self.firstPageTableView.register(UINib(nibName: firstPageTableViewCell.registerID, bundle: nil), forCellReuseIdentifier: firstPageTableViewCell.registerID)
        self.firstPageTableView.register(UINib(nibName: ArtifacDataTableViewCell.registerID, bundle: nil), forCellReuseIdentifier: ArtifacDataTableViewCell.registerID)
        firstPageTableView.frame = CGRect(x: 0, y: tableViewY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - heightBotton)
        self.view.addSubview(firstPageTableView)
        firstPageTableView.delegate = self
        firstPageTableView.dataSource = self
        firstPageTableView.rowHeight = UITableView.automaticDimension
        firstPageTableView.estimatedRowHeight = 80

        
    }
    
    func load_Data () {

        self.serviceGroup.enter()
        let service = Service()
        service.delegate = self
        
        switch pageIndex {
        case 0:
            
            service.requestCoverData()
        case 1:
            service.requestRaidBuffData()
        case 2:
            service.requesArtifacData()
        case 3:
            service.requesTopOfTimeData()
        default:
            break
        }
        
        
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
        textlabel.font = UIFont(name: "Helvetica-Bold", size: 24)
        textlabel.textAlignment = .natural
        headerView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        headerView.addSubview(textlabel)
        
        if pageIndex == 0 {
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
        }else if pageIndex == 1 {
            
            textlabel.text = ""
        }
        return headerView
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        switch pageIndex {
        case 0:
            return HERO_RACE_LIST_CT.count
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        default:
            return 1
        }
        
    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch pageIndex {
        case 0:
            return 60
        case 1:
            return 5
        case 2:
            return 5
        case 3:
            return 5
        default:
            break
        }
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if pageIndex == 0 {
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
               return helfGodHeroData?.count ?? 0
            case 5:
               return demonHeroData?.count ?? 0
            case 6:
               return netherguestHeroData?.count ?? 0
            default:
               break
          }
        }else if pageIndex == 1 {
            return self.raidBuffDataArray?.count ?? 0
        }else if pageIndex == 2 {
            return self.artifacDataArray?.count ?? 0
        }else if pageIndex == 3 {
            return self.topOfTimeData?.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        switch pageIndex {
        case 0:
             let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_NAME_FIRSTPAGE_CELL) as! firstPageTableViewCell
             cell.objectLabel.isHidden = true
             cell.featuresLabel.isHidden = true
                   switch indexPath.section {
                   case 0:
                    let cell = firstPageCellData(name: geHeroData?[row].name ?? "", level: geHeroData?[row].level ?? "", type: geHeroData?[row].type ?? "", imgUrl: geHeroData?[row].imgUrl ?? "", cell: cell)
                       return cell
                   case 1:
                    let cell = firstPageCellData(name: bloodHeroData?[row].name ?? "", level: bloodHeroData?[row].level ?? "", type: bloodHeroData?[row].type ?? "", imgUrl: bloodHeroData?[row].imgUrl ?? "", cell: cell)
                       return cell
                   case 2:
                    let cell = firstPageCellData(name: greenHeroData?[row].name ?? "", level: greenHeroData?[row].level ?? "", type: greenHeroData?[row].type ?? "", imgUrl: greenHeroData?[row].imgUrl ?? "", cell: cell)
                      return cell
                   case 3:
                    let cell = firstPageCellData(name: deadHeroData?[row].name ?? "", level: deadHeroData?[row].level ?? "", type: deadHeroData?[row].type ?? "", imgUrl: deadHeroData?[row].imgUrl ?? "", cell: cell)
                       return cell
                   case 4:
                    let cell = firstPageCellData(name: helfGodHeroData?[row].name ?? "", level: helfGodHeroData?[row].level ?? "", type: helfGodHeroData?[row].type ?? "", imgUrl: helfGodHeroData?[row].imgUrl ?? "", cell: cell)
                       return cell
                   case 5:
                    let cell = firstPageCellData(name: demonHeroData?[row].name ?? "", level: demonHeroData?[row].level ?? "", type: demonHeroData?[row].type ?? "", imgUrl: demonHeroData?[row].imgUrl ?? "", cell: cell)
                       return cell
                   case 6:
                    let cell = firstPageCellData(name: netherguestHeroData?[row].name ?? "", level: netherguestHeroData?[row].level ?? "", type: netherguestHeroData?[row].type ?? "", imgUrl: netherguestHeroData?[row].imgUrl ?? "", cell: cell)
                       return cell
                   default:
                       break
                   }
        case 1:

            let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_NAME_FIRSTPAGE_CELL) as! firstPageTableViewCell
            cell.iconWidthConstraint.constant = 0
            cell.nameLabelConstraint.constant = 20
            
            if row == 0 {
                cell.nameLabel.text = ""
                cell.levelLabel.text = ""
                cell.featuresLabel.text = ""
            }
            
            switch raidBuffDataArray?[row].grade {
              case "史詩":
                cell.levelLabel.textColor = .orange
                if raidBuffDataArray?[row].Recommendation == "S" {
                    cell.nameLabel.textColor = .orange
                }else if raidBuffDataArray?[row].Recommendation == "A" {
                    cell.nameLabel.textColor = .purple
                }else{
                    cell.nameLabel.textColor = .black
                }
              case "精英":
                cell.levelLabel.textColor = .purple
                if raidBuffDataArray?[row].Recommendation == "A" {
                    cell.nameLabel.textColor = .purple
                }else if raidBuffDataArray?[row].Recommendation == "S" {
                    cell.nameLabel.textColor = .orange
                }else{
                    cell.nameLabel.textColor = .black
                }
              case "稀有":
                cell.levelLabel.textColor = .blue
                if raidBuffDataArray?[row].Recommendation == "S" {
                    cell.nameLabel.textColor = .orange
                }else{
                    cell.nameLabel.textColor = .black
                }
              default:
                cell.levelLabel.textColor = .black
                cell.nameLabel.textColor = .black
            }
        
            cell.nameLabel.text = raidBuffDataArray?[row].Recommendation ?? ""
            cell.levelLabel.text = raidBuffDataArray?[row].name ?? ""
            cell.typeLabel.isHidden = true
            cell.objectLabel.isHidden = true
            cell.featuresLabel.text = raidBuffDataArray?[row].Features ?? ""
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_NAME_ARTIFACDATATABLEVIEW_CELL) as! ArtifacDataTableViewCell
            cell.artifacIcon.kf.setImage(with: URL(string: artifacDataArray?[row].imgUrl ?? ""))
            cell.artifacNameLabel.text = artifacDataArray?[row].name
            cell.getwayLabel.text = artifacDataArray?[row].getway
            cell.attributesLabel.text = artifacDataArray?[row].attributes
            cell.effectLabel.text = artifacDataArray?[row].effect
            cell.suggestLabel.text = artifacDataArray?[row].suggest
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_NAME_FIRSTPAGE_CELL) as! firstPageTableViewCell
            cell.iconWidthConstraint.constant = 0
            cell.nameLabelConstraint.constant = cell.frame.width
            cell.nameLabel.textColor = UIColor(red: 0.15, green: 0.15, blue: 0, alpha: 1)
            cell.nameLabel.text = topOfTimeData?[row].name
            cell.levelLabel.isHidden = true
            cell.typeLabel.isHidden = true
            cell.objectLabel.isHidden = true
            cell.featuresLabel.isHidden = true
            return cell
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       switch pageIndex {
        case 0:
             return 100
        case 1:
             return 140
        case 2:
             return 220
        case 3:
             return 60
         default:
             return 120
        }
    }
    
    private func firstPageCellData (name:String, level:String, type:String, imgUrl:String, cell:firstPageTableViewCell) -> firstPageTableViewCell {
        
        cell.levelLabel.text = level
        cell.nameLabel.text = name
        cell.typeLabel.text = type
        cell.iconImg.kf.setImage(with: URL(string: imgUrl))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if pageIndex == 0 {
            var url = ""
            switch indexPath.section {
            case 0:
                url = geHeroData?[indexPath.row].heroDetail ?? ""
            case 1:
                url = bloodHeroData?[indexPath.row].heroDetail ?? ""
            case 2:
                url = greenHeroData?[indexPath.row].heroDetail ?? ""
            case 3:
                url = deadHeroData?[indexPath.row].heroDetail ?? ""
            case 4:
                url = helfGodHeroData?[indexPath.row].heroDetail ?? ""
            case 5:
                url = demonHeroData?[indexPath.row].heroDetail ?? ""
            case 6:
                url = netherguestHeroData?[indexPath.row].heroDetail ?? ""
            default:
                break
            }
           let vc = UIStoryboard(name: STORYBOARD_NAME_MAIN, bundle: nil).instantiateViewController(withIdentifier: IDENTIFIER_NAME_WEBVIEWVIEW_CONTROLLER) as! WebViewViewController
           vc.urlString = url
           self.present(vc, animated: true, completion: nil)
            
       }else if pageIndex == 3 {
            let vc = UIStoryboard(name: STORYBOARD_NAME_MAIN, bundle: nil).instantiateViewController(withIdentifier: IDENTIFIER_NAME_WEBVIEWVIEW_CONTROLLER) as! WebViewViewController
            vc.urlString = self.topOfTimeData?[indexPath.row].imgUrl
            self.present(vc, animated: true, completion: nil)
      
        }
       
    }
        
}

extension firstPageViewController: ServiceDelegate {

    func requestCoverDataResult(_result: HeroListDataModel?) {
        
        self.heroListDataArray = _result
        
        self.bloodHeroData = heroListDataArray?.blood
        self.geHeroData = heroListDataArray?.ge
        self.deadHeroData = heroListDataArray?.dead
        self.demonHeroData = heroListDataArray?.demon
        self.greenHeroData = heroListDataArray?.green
        self.netherguestHeroData = heroListDataArray?.netherguest
        self.helfGodHeroData = heroListDataArray?.helfgod
        
        self.serviceGroup.leave()
        
    }

 
    func requestRaidBuffDataResult(_result: [RaidRelicDataModel]?) {
        
        if _result != nil {
        
          self.raidBuffDataArray = _result
            
        }else {
         
//          let alert = 
        }
          self.serviceGroup.leave()
        
    }
    
    func requestArtifacDataResult(_result: [ArtifactDataModel]?) {
        
        if _result != nil {
            self.artifacDataArray = _result
        }
        self.serviceGroup.leave()
    }
    
    func requesTopOfTimeDataResult(_result: [HeroData]?) {
        
        self.topOfTimeData = _result
        
        self.serviceGroup.leave()
    }
}

