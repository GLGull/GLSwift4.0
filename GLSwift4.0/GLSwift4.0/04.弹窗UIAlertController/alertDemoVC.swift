//
//  alertDemoVC.swift
//  GLSwift4.0
//
//  Created by gongliang on 2018/2/27.
//  Copyright © 2018年 gongliang. All rights reserved.
//

import UIKit

class alertDemoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
          self.title = "弹窗"
         pushAlertView(type: 1)
    }

   

}
extension alertDemoVC{
    func pushAlertView(type: Int){
        if type == 1 {
            // MARK: - 默认样式，注意：Swift中必须声明是iOS8.0以上才执行UIAlertController相关的代码，否则会报错
            if #available(iOS 8.0, *)
            {
                let alertController = UIAlertController(title: "提示", message: "这个是UIAlertController的默认样式", preferredStyle: UIAlertControllerStyle.alert)
                let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
                let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelAction)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                // Fallback on earlier versions
            }

        }
        if type == 2 {
            // MARK: -  警示样式
            if #available(iOS 8.0, *) {
                let alertController = UIAlertController(title: "订单", message: "这个是UIAlertController的警示样式", preferredStyle: UIAlertControllerStyle.alert)
                let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
                let okAction = UIAlertAction(title: "警示", style: UIAlertActionStyle.destructive, handler: nil)
                alertController.addAction(cancelAction)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                // Fallback on earlier versions
            }
            
        }
        if type == 3 {
            // MARK: - 文本对话框
            if #available(iOS 8.0, *) {
                
                let alertController = UIAlertController(title: "优惠", message: "这个是UIAlertController的文本对话框", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addTextField(configurationHandler: { (textField: UITextField!) -> Void in
                    textField.placeholder = "登录"
                    
                    // 添加监听代码，监听文本框变化时要做的操作
                    NotificationCenter.default.addObserver(self, selector: Selector(("alertTextFieldDidChange:")), name: NSNotification.Name.UITextFieldTextDidChange, object: textField)
                })
                
                alertController.addTextField(configurationHandler: { (textField: UITextField!) -> Void in
                    textField.placeholder = "密码"
//                    textField.secureTextEntry = true
                })
                
                let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
                let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default , handler: { (action: UIAlertAction!) -> Void in
                    let login = (alertController.textFields?.first)! as UITextField
                    let password = (alertController.textFields?.last)! as UITextField
                    print("loginStr===\(String(describing: login.text))，passWordStr===\(String(describing: password.text))")
                    
                    NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
                    
                })
                okAction.isEnabled = false
                alertController.addAction(cancelAction)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                // Fallback on earlier versions
            }
            
            // MARK: - 用户名长度超过3个字符才可以点击“好的”按钮，好了，现在对话框的“好的”按钮被冻结了，除非在“登录”文本框中输入3个以上的字符：
            func alertTextFieldDidChange(notification: NSNotification){
                if #available(iOS 8.0, *) {
                    let alertController = self.presentedViewController as! UIAlertController?
                    if (alertController != nil) {
                        _ = (alertController!.textFields?.first)! as UITextField
                        _ = alertController!.actions.last! as UIAlertAction
                        
//                        if login.text?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 3 {
//                            okAction.isEnabled = true
//                        } else {
//                            okAction.isEnabled = false
//                        }
                    }
                    
                } else {
                    // Fallback on earlier versions
                }
                
            }

        }
        if type == 4 {
            // MARK:  - 上拉菜单
            if #available(iOS 8.0, *) {
                let alertController = UIAlertController(title: "保存或删除数据", message: "删除数据将不可恢复", preferredStyle: UIAlertControllerStyle.actionSheet)
                // 如果上拉菜单中有“取消”按钮的话，那么它永远都会出现在菜单的底部，不管添加的次序是如何（就是这么任性）。其他的按钮将会按照添加的次序从上往下依次显示
                let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
                let deleteAction = UIAlertAction(title: "删除", style: UIAlertActionStyle.destructive, handler: nil)
                let archiveAction = UIAlertAction(title: "保存", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelAction)
                alertController.addAction(deleteAction)
                alertController.addAction(archiveAction)
                self.present(alertController, animated: true, completion: nil)
            } else {
                // Fallback on earlier versions
            }
            
          
        }
       

    }
    
}
