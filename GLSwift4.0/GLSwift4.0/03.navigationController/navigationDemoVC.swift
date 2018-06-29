//
//  navigationDemoVC.swift
//  GLSwift4.0
//
//  Created by gongliang on 2018/2/27.
//  Copyright © 2018年 gongliang. All rights reserved.
//
/*
   ////////////////// 全局属性
     //2.1导航背景颜色
     UINavigationBar.appearance().barTintColor=UIColor.appMainColor();
 UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(CGFloat(NSInteger.min),CGFloat(NSInteger.min)), forBarMetrics:UIBarMetrics.Default);
     //2.2导航标题文字颜色
     UINavigationBar.appearance().titleTextAttributes=NSDictionary(object:UIColor.whiteColor(), forKey:NSForegroundColorAttributeName) as? [String : AnyObject];
      //楼主的状态栏颜色改变了，设置为了白色，如果有需要，打开 info.plist  增加Key（View controller-based status bar appearance，Value为 no
     //2.3将状态栏变为白色
     UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent;
     //2.4设置返回按钮颜色
     UINavigationBar.appearance().tintColor=UIColor.whiteColor();
   //////////////////
   1.页面跳转
     self.navigationController?.pushViewController(pushVc, animated: true)
   2.导航栏返回方法
     2.1 导航的返回上一个控制器
      self.navigationController?.popViewController(animated: true)
     2.2 导航返回根导航控制器
      self.navigationController?.popToRootViewController(animated: true)
     2.3 可以跳转到堆栈内的任意一个控制器
      let NavVcs = self.navigationController?.childViewControllers;
      self.navigationController?.popToViewController((NavVcs?[1])!, animated: true)
   3.导航是否可以滑动屏幕左侧返回
     self.navigationController?.interactivePopGestureRecognizer?.delegate = self
   4.控制导航是否显示底部工具栏
     self.navigationController?.isToolbarHidden = false
     self.navigationController?.setToolbarHidden(true, animated: true)
   5.导航的显示和隐藏
     self.navigationController?.isNavigationBarHidden = true
     self.navigationController?.setNavigationBarHidden(false, animated: true)
   6.上下滑动控制器隐藏和显示控制器
     // TODO : 这个是当控制器上下滑动，导航的显示与隐藏
     self.navigationController?.hidesBarsOnSwipe = true
   7.用户点击控制器，导航才显示与隐藏
     // TODO : 这个是用户点击控制器，导航才显示与隐藏
     self.navigationController?.hidesBarsOnTap = true
   8.键盘的弹出会隐藏导航栏
     // TODO : 这个是当键盘出现，导航会隐藏。
     self.navigationController?.hidesBarsWhenKeyboardAppears = true
   9.当页面垂直紧凑的时候，会隐藏导航栏
     // TODO : 当导航栏的垂直size比较紧凑的时候，导航栏自动隐藏
     self.navigationController?.hidesBarsWhenVerticallyCompact = true
  10.获取上下滑动控制器隐藏导航栏的手势& 点击控制器，隐藏导航栏的手势、
     10.1 上下隐藏导航的手势
     // TODO : 获取上下滑动隐藏导航的手势
     let OnSwipeGesture = self.navigationController?.barHideOnSwipeGestureRecognizer
     OnSwipeGesture?.maximumNumberOfTouches =  2
     10.2 点击隐藏导航的手势
     // TDOD : 获取点击控制器隐藏导航的手势
     let OnTapGesture = self.navigationController?.barHideOnTapGestureRecognizer
     OnTapGesture?.numberOfTouchesRequired = 2
   11.控制器的获取
     11.1 获取当前导航栈里所有的控制器
     let NavVcs = self.navigationController?.viewControllers
     print(NavVcs!)
     11.2 获取当前显示的控制器
     let CurVc = self.navigationController?.visibleViewController
     if CurVc==self {
     print("相同")
     }
     11.3 获取某个导航栈的顶部控制器
     let TopVc = self.navigationController?.topViewController
     print(TopVc!)
 
 
 */
import UIKit

class navigationDemoVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor.orange
        //导航栏还可以设置图片.
        //self.navigationBar.setBackgroundImage(UIImage(named: "testnavigationBar"), forBarMetrics: UIBarMetrics.Default)
        //修改导航标题的样式
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.red,NSAttributedStringKey.font:UIFont.italicSystemFont(ofSize: 20)]
        
      
      }
    // 这是导航每次发生跳转都调用该函数
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // 当前页控制器和跳转后的控制器
        print(navigationController,viewController)
    }
 /*
    // 导航每次发生跳转前先调用的函数
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // 当前页控制器和将要跳转后的控制器
        print(navigationController,viewController)
    }
    
    // 导航支持的屏幕方向
    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return .all
    }
    // 导航首先支持的屏幕方向
    func navigationControllerPreferredInterfaceOrientationForPresentation(_ navigationController: UINavigationController) -> UIInterfaceOrientation {
        return .portrait
    }
   */
   
    
 
 

}
