//
//  navigationDemoTwoVC.swift
//  GLSwift4.0
//
//  Created by gongliang on 2018/2/28.
//  Copyright © 2018年 gongliang. All rights reserved.
//

import UIKit
class navigationDemoTwoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "navDemo"
        let rightBarButtonItem = UIBarButtonItem.init(title: "确定", style: .plain, target: self, action: #selector(rightBarButtonItemMethod))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        //修改右边按钮字体颜色
    self.navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.black], for: .normal)
    }
    @objc func rightBarButtonItemMethod() -> Void {
        print("确定")
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
