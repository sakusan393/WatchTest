//
//  ViewController.swift
//  WatchTest
//
//  Created by sakurai hiroyuki on 2015/04/29.
//  Copyright (c) 2015年 sakurai hiroyuki. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playSound(){
        AVAudioPlayerUtil.play()
    }
    func playSoundAtIndex(count:String){
        AVAudioPlayerUtil.playAtIndex(count)
    }
    func playVibe(){
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }


}

