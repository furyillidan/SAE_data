//
//  AllHeroDataListModel.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/3/26.
//  Copyright © 2020 Neo Chou. All rights reserved.
//

import UIKit

class AllHeroDataListModel : NSObject, Codable {
    
    var blood : [HeroData]?
    var dead : [HeroData]?
    var demon : [HeroData]?
    var ge : [HeroData]?
    var green : [HeroData]?
    var helfgod : [HeroData]?
    var netherguest : [HeroData]?
}
