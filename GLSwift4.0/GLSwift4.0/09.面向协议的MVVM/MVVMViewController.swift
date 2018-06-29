//
//  MVVMViewController.swift
//  GLSwift4.0
//
//  Created by gongliang on 2018/3/23.
//  Copyright © 2018年 gongliang. All rights reserved.
//

import UIKit
import SnapKit
class MVVMViewController: UIViewController {
    let mianView = M_View()
    let model = M_Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "面向协议的MVVM"
        view.backgroundColor = UIColor.white
        addView()
        let Astring = ("404","asdasda")
        let (bstring,_) = Astring
        print(bstring)
        print("num:\(Astring.0)")
    }
    func addView(){
        view.addSubview(mianView)
        mianView.addData(WintDelegate: M_ViewModel(model:model))
        mianView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    

  

}
