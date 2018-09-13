//
//  item.swift
//  Demo
//
//  Created by mino on 9/11/18.
//  Copyright © 2018 mino. All rights reserved.
//

import Foundation

class item {
    
    var title :String?
    var desc : String?
    var path : String?
    
    init(tit:String? , des:String?, pa:String?) {
        self.title = tit
        self.desc = des
        self.path = pa
    }
}
