//
//  TabBarDemoVC.swift
//  GLSwift4.0
//
//  Created by gongliang on 2018/2/27.
//  Copyright © 2018年 gongliang. All rights reserved.
//

import UIKit

class TabBarDemoVC: UITabBarController {
    let oneViewControlloer = UIViewController()
    let twoViewControlloer = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        addVC()
   
    }
    func addView(){
        //根据颜色值画条线
        let rect = CGRect(x:0,y:0,width:view.frame.size.width,height:0.5)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.red.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        //这两个很主要缺一不可
        self.tabBar.shadowImage = image
        self.tabBar.backgroundImage = UIImage()
        
        // 设置字体偏移
        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0.0, -5.0)
        
        //tabBar 底部工具栏背景颜色 (以下两个都行)
        //self.tabBar.barTintColor = UIColor.orange
        self.tabBar.backgroundColor = UIColor.white
        
        //设置 tabBar 工具栏字体颜色 (未选中  和  选中)
        //未选中
//        let dict:NSDictionary = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)]

        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object:UIColor.black, forKey:NSAttributedStringKey.foregroundColor as NSCopying) as? [NSAttributedStringKey : Any], for: UIControlState.normal)
        //选中
        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object:UIColor.red, forKey:NSAttributedStringKey.foregroundColor as NSCopying) as? [NSAttributedStringKey : Any], for: UIControlState.selected)
        
        // 设置图片选中时颜色必须设置（系统默认选中蓝色）
        UITabBar.appearance().tintColor = UIColor.black
        //或者写法都是一样的
        //self.tabBar.tintColor = UIColor.black
    }
    func addVC(){
        setupChildVC(oneViewControlloer, title: "首页", imageView: "", selectImageView: "")
        setupChildVC(twoViewControlloer, title: "个人", imageView: "", selectImageView: "")
    }
    func setupChildVC(_ childVC: UIViewController ,title: String ,imageView: String ,selectImageView: String ) {
        childVC.title = title;
        childVC.tabBarItem.image = UIImage.init(named: imageView)
        childVC.tabBarItem.selectedImage = UIImage.init(named: selectImageView)?.withRenderingMode(.alwaysOriginal)
        let navigationCtrl = UINavigationController.init(rootViewController: childVC)
        navigationCtrl.navigationBar.barTintColor = UIColor.orange
        addChildViewController(navigationCtrl)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
