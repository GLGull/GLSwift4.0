//
//  M_ViewModel.swift
//  GLSwift4.0
//
//  Created by gongliang on 2018/3/23.
//  Copyright © 2018年 gongliang. All rights reserved.
//

import UIKit

class M_ViewModel: NSObject,M_ViewProtocol {
    var ViewA_Color: UIColor
    var ViewB_Color: UIColor
    init(model:M_Model) {
        ViewA_Color = model.colorA
        ViewB_Color = model.colorB
    }
    
    
}
