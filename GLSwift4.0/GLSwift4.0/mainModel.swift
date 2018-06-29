//
//  mainModel.swift
//  GLSwift4.0
//
//  Created by gongliang on 2018/2/26.
//  Copyright © 2018年 gongliang. All rights reserved.
//

import UIKit

class mainModel: NSObject {
    let tableViewArray : Array<String>
    var pickerArray :NSMutableArray!
    override init() {
        tableViewArray = ["1.UITabBarController","2.NavigationCotroller","3.弹窗UIAlertController","4.UICollectionView","5.basicControlVC","6.多媒体","7.计步器","8.面向协议的MVVM"]
        pickerArray = ["1.UITabBarController","2.NavigationCotroller","3.弹窗UIAlertController","4.UICollectionView","5.basicControlVC"]
    }
    
}
