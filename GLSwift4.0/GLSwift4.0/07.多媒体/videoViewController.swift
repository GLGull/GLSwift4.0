//
//  videoViewController.swift
//  GLSwift4.0
//
//  Created by gongliang on 2018/3/16.
//  Copyright © 2018年 gongliang. All rights reserved.
//

import UIKit
import AVKit
import SnapKit
class videoViewController: UIViewController {
    let avVideoViewController = AVPlayerViewController()
    var avVideoView = AVPlayer()
    let addVideoButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        addView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
extension videoViewController{
    func addView(){
        addVideoButton.setTitle("加载视频", for: .normal)
        addVideoButton.layer.masksToBounds = true
        addVideoButton.layer.borderWidth = 1
        addVideoButton.layer.borderColor = UIColor.orange.cgColor
        addVideoButton.setTitleColor(UIColor.black, for: .normal)
        addVideoButton.addTarget(self, action: #selector(addVideoButtonSelector), for: .touchUpInside)
        view.addSubview(addVideoButton)
        addVideoButton.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(45)
        }
    }
    @objc func addVideoButtonSelector(){
        print("点击了")
        let path = Bundle.main.path(forResource: "welcome_video", ofType: "mp4")
        avVideoView = AVPlayer.init(url: URL.init(fileURLWithPath: path!))
        avVideoViewController.player = avVideoView
        self.present(avVideoViewController, animated: true, completion: nil)
        
    }
}
