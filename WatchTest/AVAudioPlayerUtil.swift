//
//  AVAudioPlayerUtil.swift
//  WatchTest
//
//  Created by sakurai hiroyuki on 2015/04/29.
//  Copyright (c) 2015年 sakurai hiroyuki. All rights reserved.
//

import AVFoundation

struct AVAudioPlayerUtil{
    static var audioPlayer:AVAudioPlayer = AVAudioPlayer();
    static var sound_data:NSURL = NSURL();
    
    
    
    static func setValue(path:String){
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("onara_0", ofType: "mp3")!)
        
        self.audioPlayer = AVAudioPlayer(contentsOfURL: audioPath, error: nil);
        self.audioPlayer.prepareToPlay();
    }
    static func play(){
        let count = Int(arc4random_uniform(UInt32(6)));
        
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("onara_"+String(count), ofType: "mp3")!)
        
        self.audioPlayer = AVAudioPlayer(contentsOfURL: audioPath, error: nil);
        self.audioPlayer.prepareToPlay();
        self.audioPlayer.play();
    }
    static func playAtIndex(index:String){
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("onara_" + index, ofType: "mp3")!)
        
        self.audioPlayer = AVAudioPlayer(contentsOfURL: audioPath, error: nil);
        self.audioPlayer.prepareToPlay();
        self.audioPlayer.play();

    }
}
