//
//  TableViewDemoVC.swift
//  GLSwift4.0
//
//  Created by gongliang on 2018/2/27.
//  Copyright © 2018年 gongliang. All rights reserved.
//

import UIKit
import SnapKit
class TableViewDemoVC: UIViewController {
        let tableView = UITableView()
        var model = mainModel()
        let cellID = "cellID"
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "GL-Swift4.0"
            view.backgroundColor = UIColor.white
            //automaticallyAdjustsScrollViewInsets是根据所在界面的status bar、navigationbar和tabbar的高度，自动调整UIScrollView的inset，默认的automaticallyAdjustsScrollViewInsets状态是YES。如果遇到从当前界面跳转到下一个界面的时候，导航栏多出来一个或者tabbar隐藏不了等问题的，大部分情况都是automaticallyAdjustsScrollViewInsets状态是YES造成的，那么这时候果断在viewDidLoad这个方法里面加一句：self.automaticallyAdjustsScrollViewInsets = NO; 不让它自动留出空白，由开发者自己去控制留白及坐标问题
            //        self.automaticallyAdjustsScrollViewInsets = false
            //iOS7之后由于navigationBar.translucent默认是YES，原点在（0，0）点 当设置NO的时候，原点坐标在（0，64）点开始，屏幕会多一个导航栏的高度
//            self.navigationController?.navigationBar.isTranslucent = false
            
            //加载界面
            addView()
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
    }
extension TableViewDemoVC : UITableViewDelegate, UITableViewDataSource {
    //添加tableView
    func addView(){
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        //注册cell
        tableView.register(GLOneTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
    }
    func tablViewData(){
        tableView.reloadData()
    }
    //组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.tableViewArray.count
    }
    //每组几行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    //cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    //组头高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    //组头内容
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    //组尾内容
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    //组尾高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    //cell内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)as?GLOneTableViewCell
        if cell == nil {
            cell = GLOneTableViewCell(style: .value1 ,reuseIdentifier:cellID)
        }
        cell?.addDataWithModel(model: model, indexPath: indexPath)
        cell?.backgroundColor = UIColor.orange
        return cell!
    }
    //cell点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //点击后动画马上消失
//        tableView.deselectRow(at: indexPath, animated: false)
        print("点击了\(indexPath.section)")
        if indexPath.section == 0 {
            pushAlertController(string: "请在AppDelegate类里进行操作")
//             navigationController?.pushViewController(TabBarDemoVC(), animated: true)
        }
        if indexPath.section == 1 {//导航栏
            let nav = navigationDemoVC.init(rootViewController: navigationDemoTwoVC())
            self.present(nav, animated: true, completion: {
                print("模态跳转")
            })
        }
        if indexPath.section == 2 {//弹窗
            navigationController?.pushViewController(alertDemoVC(), animated: true)
        }
        if indexPath.section == 3 {//UICollectionView瀑布流
            navigationController?.pushViewController(UICollectionViewVC(), animated: true)
        }
        if indexPath.section == 4 {//各种基础控件
            navigationController?.pushViewController(basicControlVC(), animated: true)
        }
        if indexPath.section == 5 {//多媒体
            navigationController?.pushViewController(videoViewController(), animated: true)
        }
        if indexPath.section == 6 {
            navigationController?.pushViewController(PedometerViewController(), animated: true)
        }
        if indexPath.section == 7 {
            navigationController?.pushViewController(MVVMViewController(), animated: true)
        }
        
    }
    //弹窗
    func pushAlertController(string: String){
        if #available(iOS 8.0, *){//必须满足8.0之后的版本
            let alertController = UIAlertController(title: "温馨提示", message:string , preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default, handler: { (Alert: UIAlertAction) in
                print("👌👌👌")
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
        // Fallback on earlier versions
        }

    }
}
