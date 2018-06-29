//
//  M_View.swift
//  GLSwift4.0
//
//  Created by gongliang on 2018/3/23.
//  Copyright © 2018年 gongliang. All rights reserved.
//

import UIKit
import SnapKit
protocol M_ViewProtocol {
    var ViewA_Color: UIColor {get}
    var ViewB_Color: UIColor {get}
}
protocol M_ViewWintData {
    
}
class M_View: UIView {
    let viewA = UIView()
    let viewB = UIView()
    let colorButton = UIButton(type: .system)
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addView(){
        colorButton.setTitle("点击换色", for: .normal)
        colorButton.setTitleColor(UIColor.black, for: .normal)
        colorButton.layer.masksToBounds = true
        colorButton.layer.borderWidth = 1
        colorButton.layer.borderColor = UIColor.black.cgColor
        colorButton.addTarget(self , action: #selector(colorButtonSelector(button:)), for: .touchUpInside)
        addSubview(viewA)
        addSubview(viewB)
        addSubview(colorButton)
    
        viewA.snp.makeConstraints { (make) in
            make.centerX.equalTo(self).offset(-200)
            make.centerY.equalTo(self)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        viewB.snp.makeConstraints { (make) in
            make.centerX.equalTo(self).offset(200)
            make.centerY.equalTo(self)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        colorButton.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(self)
            make.height.equalTo(50)
        }
    }
    func addData(WintDelegate delegate:M_ViewProtocol){
        viewA.backgroundColor = delegate.ViewA_Color
        viewB.backgroundColor = delegate.ViewB_Color
        
    }
    @objc func colorButtonSelector(button:UIButton){
        print("点击")
    }

}
