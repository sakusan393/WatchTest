//
//  Model.swift
//  WatchTest
//
//  Created by sakurai hiroyuki on 2015/04/30.
//  Copyright (c) 2015年 sakurai hiroyuki. All rights reserved.
//

import Foundation


class Model:NSObject {
    
    static let sharedInstance = Model()
    
    let LABEL_TEXT:String = "DELAY TIME:"
    
    var delayTime:Int = 0
    var isVibe:Int = 0
}