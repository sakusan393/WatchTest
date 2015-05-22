//
//  UtilInterfaceController.swift
//  WatchTest
//
//  Created by sakurai hiroyuki on 2015/04/30.
//  Copyright (c) 2015年 sakurai hiroyuki. All rights reserved.
//

import Foundation
import WatchKit


class UtilInterfaceController:WKInterfaceController{
    
    @IBOutlet weak var slider:WKInterfaceSlider!
    @IBOutlet weak var label:WKInterfaceLabel!
    @IBOutlet weak var `switch`: WKInterfaceSwitch!
    
    
    @IBAction func changeSwitch(value: Bool) {
        println("\(value)")
        if value{
            Model.sharedInstance.isVibe = 1
        }else{
            Model.sharedInstance.isVibe = 0
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }
    
    @IBAction func onSlider(value:Int){
        label.setText(Model.sharedInstance.LABEL_TEXT + String(value) + "sec")
        Model.sharedInstance.delayTime = value
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
