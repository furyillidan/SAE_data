//
//  CoverDataModel.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/3/23.
//  Copyright © 2020 Neo Chou. All rights reserved.
//

import UIKit

class HeroListDataModel : NSObject, Codable {
    var blood : [HeroData]?
    var dead : [HeroData]?
    var demon : [HeroData]?
    var ge : [HeroData]?
    var green : [HeroData]?
    var helfgod : [HeroData]?
    var netherguest : [HeroData]?
    var heroCount : String?
}


class HeroData : NSObject, Codable {
    var imgUrl : String?
    var firstdraw : String?
    var intro : String?
    var name : String?
    var positioning : String?
    var level : String?
    var type : String?
    var heroDetail : String?
}
