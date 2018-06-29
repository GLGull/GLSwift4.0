//
//  explanation.swift
//  GLSwift4.0
//
//  Created by gongliang on 2018/2/26.
//  Copyright © 2018年 gongliang. All rights reserved.
//

import UIKit
/*
 1. cocopods 安装
     1.pod update  更新所有库
     2.pod install 更新项目库（从本地库更新）
     
 */
/*
 1. let 常量  var 变量
 
 2. ?与！
    ? 的使用场景:
     1.声明Optional值变量
     2.用在对Optional值操作中，用来判断是否能响应后面的操作
     3.使用 as? 向下转型(Downcast)
     // 例子最为简单明了
     var str: String? = "Hello"
     let greeting = "World!"
     if let name = str {
     let message = greeting + name
     print(message
     )}
 
     /**自然语言解释意思：就是如果str有值,解包它,并且将它的值赋值给name,
     然后执行下面的条件语句; 如果str为空, 直接跳过条件语句块。*/

    !(硬解包) 的使用场景:
     1.强制对Optional值进行拆包(unwrap)
     2.声明隐式拆包变量，一般用于类中的属性
 
 3.automaticallyAdjustsScrollViewInsets 与 navigationBar.translucent
     1.self.automaticallyAdjustsScrollViewInsets = false
      automaticallyAdjustsScrollViewInsets是根据所在界面的status bar、navigationbar和tabbar的高度，自动调整UIScrollView的inset，默认的automaticallyAdjustsScrollViewInsets状态是YES。如果遇到从当前界面跳转到下一个界面的时候，导航栏多出来一个或者tabbar隐藏不了等问题的，大部分情况都是automaticallyAdjustsScrollViewInsets状态是YES造成的，那么这时候果断在viewDidLoad这个方法里面加一句：self.automaticallyAdjustsScrollViewInsets = NO; 不让它自动留出空白，由开发者自己去控制留白及坐标问题
     2.self.navigationController?.navigationBar.isTranslucent = false
       iOS7之后由于navigationBar.translucent默认是YES，原点在（0，0）点 当设置NO的时候，原点坐标在（0，64）点开始，屏幕会多一个导航栏的高度
 
 4. _ 一个下横杠 ??
 
 
 

*/
