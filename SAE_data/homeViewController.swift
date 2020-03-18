//
//  homeViewController.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/3/13.
//  Copyright © 2020 Neo Chou. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var homeTableview: UITableView!
    var collectionViewFlowLayout : UICollectionViewFlowLayout!
    let cellIdIdentifier = "homeCollectionViewCell"
    var filterTitleArr = ["英雄列表","副本遺物","神器收集","時光之巔"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        let nib = UINib(nibName: cellIdIdentifier, bundle: nil)
        homeCollectionView.register(nib, forCellWithReuseIdentifier: cellIdIdentifier)
        self.homeTableview.delegate = self
        self.homeTableview.dataSource = self
        self.homeTableview.rowHeight = UITableView.automaticDimension
        self.homeTableview.estimatedRowHeight = 80
        self.homeTableview.allowsSelection = false
    }
    
    override func viewDidLayoutSubviews() {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: 100, height: 30)
        layout.scrollDirection = .horizontal
               
        homeCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
}

extension homeViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterTitleArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdIdentifier, for: indexPath) as! homeCollectionViewCell
        cell.infoLabel.text = filterTitleArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize = CGSize()
        let textFont = UIFont.systemFont(ofSize: 17)
        let textString = filterTitleArr[indexPath.item]
        let textMaxSize = CGSize(width: 240, height: CGFloat(MAXFLOAT))
        let textLabelSize = self.textSize(text: textString, font: textFont, maxSize: textMaxSize)
        cellSize.width = textLabelSize.width + 80
        cellSize.height = 30
        return cellSize
    }
    
    
    func textSize (text: String, font: UIFont, maxSize: CGSize) -> CGSize {
        return text.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font : font], context: nil).size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            break
        case 1:
            break
        default:
            break
        }
        
       
    }
    
}

extension homeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! homeCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
