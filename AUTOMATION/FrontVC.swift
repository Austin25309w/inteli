//
//  FrontVC.swift
//  AUTOMATION
//
//  Created by austin on 5/23/18.
//  Copyright © 2018 austin. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class FrontVC: UIViewController {
    @IBOutlet weak var videoVideo: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupView() {
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "fly_backyard", ofType:"mov")!)
        let player = AVPlayer(url: path)
        
        let newLayer = AVPlayerLayer(player: player)
        newLayer.frame = self.videoVideo.frame
        self.videoVideo.layer.addSublayer(newLayer)
        newLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        player.play()
        player.actionAtItemEnd = AVPlayerActionAtItemEnd.none
        
        NotificationCenter.default.addObserver(self, selector: #selector(FrontVC.videoDidPlayToEnd(_:)), name: NSNotification.Name(rawValue:"AVPlayerItemDidPlayToEndTimeNotification"), object: player.currentItem)
    }
    @objc func videoDidPlayToEnd(_ notification: Notification) {
        let player: AVPlayerItem = notification.object as! AVPlayerItem
        player.seek(to: kCMTimeZero)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
