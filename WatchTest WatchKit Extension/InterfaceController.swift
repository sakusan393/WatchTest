//
//  InterfaceController.swift
//  WatchTest WatchKit Extension
//
//  Created by sakurai hiroyuki on 2015/04/29.
//  Copyright (c) 2015年 sakurai hiroyuki. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    

    @IBOutlet weak var wkTimer: WKInterfaceTimer!
    @IBOutlet weak var table: WKInterfaceTable!
    @IBOutlet weak var utilInterfaceController:UtilInterfaceController!
    var timer:NSTimer!
    
    var rows = ["BOOO","BOO","SUUUSH","BOOO BU","BIIBOOOOBII","BIII"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        table.setNumberOfRows(rows.count, withRowType: "MyRow")
        for i in 0..<rows.count{
            var r = table.rowControllerAtIndex(i) as! MyRow
            r.myLabel.setText(rows[i])
        }
    }

    @IBAction func tapBtn() {
        playBoo(false, index: 0)
    }
    
    override func table(table:WKInterfaceTable, didSelectRowAtIndex rowIndex:Int){
        playBoo(true, index: rowIndex)
    }
    
    func playBoo(isRandom:Bool, index:Int){
        let data = ["booIndex":index,"isRandom":isRandom]
        if timer?.valid == true{
            timer.invalidate()
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(Double(Model.sharedInstance.delayTime), target: self, selector: Selector("timerFinished:"), userInfo: data, repeats: false)
        wkTimer.setDate(NSDate().dateByAddingTimeInterval(Double(Model.sharedInstance.delayTime)+1))
        wkTimer.start()
    }
    
    func timerFinished(timer:NSTimer){
        if let info: AnyObject = timer.userInfo{
            let index = info["booIndex"] as! Int
            let isRandom = info["isRandom"] as! Bool
            println("timerFinished : \(index)")
            if isRandom == false{
                WKInterfaceController.openParentApplication(["fromWatchKit":[index,Model.sharedInstance.isVibe]], reply: {replyInfo,error in println(replyInfo["fromApp"]!)})
                
            }else{
                WKInterfaceController.openParentApplication(["fromWatchKit2":[index,Model.sharedInstance.isVibe]], reply: {replyInfo,error in println(replyInfo["fromApp"]!)})
            }
        }
        wkTimer.stop()
        wkTimer.setDate(NSDate().dateByAddingTimeInterval(Double(Model.sharedInstance.delayTime)+1))
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()

        wkTimer.setDate(NSDate().dateByAddingTimeInterval(Double(Model.sharedInstance.delayTime)+1))
        if Model.sharedInstance.delayTime == 0{
            wkTimer.setHidden(true)
        }else{
            wkTimer.setHidden(false)
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
