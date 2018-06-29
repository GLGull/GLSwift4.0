//
//  UICollectionViewVC.swift
//  GLSwift4.0
//
//  Created by gongliang on 2018/2/28.
//  Copyright © 2018年 gongliang. All rights reserved.
//

import UIKit
import SnapKit
class UICollectionViewVC: UIViewController {
    var collectionView : UICollectionView?
    //创建UICollectionViewFlowLayout
    let flowLayout = UICollectionViewFlowLayout()
    let cellID = "cellID"
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UICollectionView"
        addView()
    }
    
   
    
}
extension UICollectionViewVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func addView(){
        collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), collectionViewLayout: flowLayout)
        //最小间隔
//        flowLayout.minimumLineSpacing = 1
        //临时最小间隔
//        flowLayout.minimumInteritemSpacing = 0.5
        //设置每个cell的大小
//        flowLayout.itemSize = CGSize.init(width: 50, height: 50)
        //设置cell的滑动方向 vertical-垂直 horizontal-水平
        flowLayout.scrollDirection = .vertical
        //设置头和尾的大小（）
//        flowLayout.headerReferenceSize = CGSize.zero
//        flowLayout.footerReferenceSize = CGSize.zero
//        //设置 UICollectionView 的section 的偏移
//        flowLayout.sectionInset = UIEdgeInsets.zero
        //设置 UICollectionView 的headerView 和footerView 能够悬浮在屏幕的顶部
        flowLayout.sectionFootersPinToVisibleBounds = true
        flowLayout.sectionFootersPinToVisibleBounds = true
        
        collectionView?.setCollectionViewLayout(flowLayout, animated: true)
        collectionView?.delegate = self
        collectionView?.dataSource = self
//        if #available(iOS 10.0, *) {
//            //预加载代理
//            collectionView.prefetchDataSource = self as? UICollectionViewDataSourcePrefetching
//            // 是否允许预加载
//              collectionView.isPrefetchingEnabled = true
//        } else {
//            // Fallback on earlier versions
//        }
        view.addSubview(collectionView!)
        
        //注册cell
        collectionView?.register(CollectionViewCellDemo.self, forCellWithReuseIdentifier: cellID)
        collectionView?.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header_id")
        collectionView?.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer_id")
        //设置背景View
        collectionView?.backgroundView = UIView()
        //设置cell是否能够被选中
        collectionView?.allowsSelection = true
        
        //更新数据
//        collectionView.reloadData()
       
//        collectionView.snp.makeConstraints { (make) in
//            make.edges.equalTo(view)
//        }
        
    }
    //UICollectionViewDelegateFlowLayout的代理事件
    
    //设置UICollectionView的Item的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 50, height: 50)
    }
    
    //设置UICollectionView的Section的上、下、左、右 的偏移
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 20, left: 0, bottom: 40, right: 0)
    }
    
    //设置UICollectionView的Section的HeaderView的大小(宽、高）
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: self.view.frame.width, height: 30)
    }
    
    //设置UICollectionView的Section的footerView的大小(宽、高）
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: self.view.frame.width, height: 30)
    }
    
    //设置UICollectionView的items之间的上下临时最小间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    //设置UICollectionView的items之间的上下最小间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  5
    }
    //UICollectionViewDataSourcePrefetching 的代理方法的介绍
    //UICollectionView预先加载的数据
//    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
//        //获取cell ，赋值数据
//    }
//    //UICollectionView取消预先加载的数据
//    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
//        // 取消预加载
//    }
    
    //UICollectionViewDataSource 的代理事件
    //设置 UICollectionView 的每一个组（Section）,含有Item 的个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    //设置UICollectionView返回的组数（Section）
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    //这是设置 UICollectionView 的cell 的布局函数
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 创建 CollectionView 的cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:cellID , for: indexPath)as?CollectionViewCellDemo
        // 设置简单的样式
        cell?.contentView.backgroundColor = UIColor.red
        // 返回变量
        return cell!
    }
    
    //UICollectionView 的 headerView & footerView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 创建一个中间变量
        var IdentifierStr =  String.init()
        // 判断是headerView & footerView
        if kind == UICollectionElementKindSectionHeader {
            IdentifierStr = "header_id"
        }else if (kind == UICollectionElementKindSectionFooter) {
            IdentifierStr = "footer_id"
        }
        // 创建一个 UICollectionReusableView 对象
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: IdentifierStr, for: indexPath)
        if kind == UICollectionElementKindSectionHeader {
            reusableView.backgroundColor = UIColor.magenta
        }else if (kind == UICollectionElementKindSectionFooter){
            reusableView.backgroundColor = UIColor.green
        }
        // 返回 UICollectionReusableView 类的对象
        return reusableView
    }
    
    //CollectionView 的编辑时设置是否可以移动 Item
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //UICollectionView 的 Items 移动后，数据资源也要变更
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        /* 这更新原始数据库为变更后的数据结构 */
    }
    
//    //UICollectionView 的索引返回参数
//    func indexTitles(for collectionView: UICollectionView) -> [String]? {
//        return ["A","B","C","D","E","s"]
//    }
    
    
//    func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
//        print(title)
//        print(index)
//        return IndexPath.init()
//    }
    //UICollectionViewDelegate 的代理方法的实现
    //设置CollectionView 的 Item 是否点击Item变为高亮状态。返回结果： true 点击Item 变为高亮状态;false  点击不变为高亮状态
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //UICollectionView 哪一个Item 被点击成为高亮状态后调用该函数
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        print("高亮" + "\(indexPath.section)" + "--" + "\(indexPath.row)")
    }
    
    //UICollectionView的Item有高亮状态变为非高亮状态时调用的函数
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        print("不高亮" + "\(indexPath.section)" + "--" + "\(indexPath.row)")
    }
    
    //UICollectionView 是否允许取消选中
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //UICollectionView 的 Item 点击选中触发该方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item 被选中")
    }
    
    //UICollectionView 的取消选中操作时调用的函数
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    
    //UICollectionViewCell 将要显示在视图上的时候调用该函数
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("将要显示的cell" + "\(indexPath.section)" + "\(indexPath.row)")
    }
    
    //UICollectionViewCell 显示结束，指的是Cell滑动移出视图时调用该函数
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("cell 显示结束" + "\(indexPath.section)" + "\(indexPath.row)")
    }
    
    //UICollectionView 的headerView 和 footerView 将要出视图的时调用
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        print("headerView 和 footerView 将要出现在当前视图")
    }
    
    //UICollectionView 的headerView 和 footerView 滑动移出视图的时调用
    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        print("headerView 和 footerView 被移出当前视图")
    }
    
    
    //是否允许 Item 是否显示菜单（Cut/Copy/Paste）
    func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //设置是否允许菜单内显示那些按钮
    func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        // 我们可以控制菜单内的按钮显示
        if action == #selector(UIResponderStandardEditActions.cut(_:)){
            return false
        }
        return true
    }
    
    //用户点击菜单内的按钮触发的函数
    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        print("菜单内的按钮被点击")
    }
    
    //设置 UICollectionView 的 Item 是否可以选择。返回结果：true 可以选择 、 false 不可以选择
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // TODO: UICollectionView 重新布局调用该方法
//    func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
//        let  TransitionLayout = UICollectionViewTransitionLayout.init(currentLayout: self.ctreateFlowLayout(), nextLayout: self.ctreateFlowLayout())
//        return TransitionLayout
//    }
    
   
    
    
    
    
    
    ///其它方法
    func collectionViewDelegate(){
        //设置cell 能够多选
        collectionView?.allowsMultipleSelection = true
        // 滑到指定cell位置
        collectionView?.scrollToItem(at: IndexPath.init(row: 2, section: 2), at: .top, animated: true)
        //滑到指定cell位置并选中它
        collectionView?.selectItem(at: IndexPath.init(row: 2, section: 2), animated: true, scrollPosition: .top)
        //取消选中的cell
        //        collectionView.deselectItem(at: IndexPath.init(row: 2, section: 2), animated: true)
        //更新布局
//        collectionView.setCollectionViewLayout(flowLayout, animated: true) { (isFinsish) in
//                    //更新之后的操作
//                }
        // 准备好动画，调用该方法开始动画对collectionView进行布局，成功后就会回调 setCollectionViewLayout：animated ：{} 方法
        collectionView?.finishInteractiveTransition()
        // 取消对collectionView布局的动画，并回调 setCollectionViewLayout：animated ：{} 该方法
        collectionView?.cancelInteractiveTransition()
        
        // 获取 collectionView 的整个 Section 的个数
        let totalSection = collectionView?.numberOfSections
        print(totalSection as Any)
        // 获取 collectionView 的某一个 Section 中 item 的个数
        let itemCount = collectionView?.numberOfItems(inSection: 2)
        print(itemCount as Any)
        
        // 获取 collectionView 的 Item 属性
        let ItemLayoutAttributes =  collectionView?.layoutAttributesForItem(at: IndexPath.init(row: 1, section: 2))
        // UICollectionViewLayoutAttributes 属性我们可以获取一些关于itme的属性，例如：大小、透明度、是否隐藏、IndexPath ... 等
        print((ItemLayoutAttributes?.frame,ItemLayoutAttributes?.size,ItemLayoutAttributes?.indexPath,ItemLayoutAttributes?.alpha))
        
        // 获取 collectionView 的 ReusableView 的一些属性
        let ReusableViewLayoutAttributes = collectionView?.layoutAttributesForSupplementaryElement(ofKind: UICollectionElementKindSectionHeader, at: IndexPath.init(item: 0, section: 2))
        // UICollectionViewLayoutAttributes 属性我们可以获取一些关于ReusableView的属性，例如：大小、透明度、是否隐藏、IndexPath ... 等
        print((ReusableViewLayoutAttributes?.frame,ReusableViewLayoutAttributes?.size,ReusableViewLayoutAttributes?.indexPath,ReusableViewLayoutAttributes?.alpha))
        
        // 通过collectionView 的Item上某一点获取改 Item 的 indexPath
        
        let point_indexPath = collectionView?.indexPathForItem(at: CGPoint.init(x: 100, y: 200))
        // 通过 point_indexPath 就可以知道你点击的是哪个 Section 的 item
        print((point_indexPath?.row ,point_indexPath?.section))
        
        // 通过 UICollectionViewCell 来获取 indexPath
        let cell_indexPath = collectionView?.indexPath(for: UICollectionViewCell.init())
        // 通过 cell_indexPath 就可以知道你点击的是哪个 Section 的 item
        print((cell_indexPath?.row ,cell_indexPath?.section))
        
        // 通过indexPath 来获取 cell
        let Index_cell = collectionView?.cellForItem(at: IndexPath.init(row: 2, section: 2))
        print(Index_cell!)
        
        // 获取 UICollectionView 视图可见的 Cell
        let AbleCells = collectionView?.visibleCells
        print(AbleCells as Any)
        
        // 获取视图上可见的 Item 的 indexPath
        let Item_indexPaths = collectionView?.indexPathsForVisibleItems
        print(Item_indexPaths as Any)
        
        // 通过指定的indexPath 还获取 UICollectionView的 headerView & fotterView
        let XReusableView = collectionView?.supplementaryView(forElementKind: UICollectionElementKindSectionHeader, at: IndexPath.init(row: 0, section: 2))
        print(XReusableView!)
        
        // 通过给定的类型（UICollectionElementKindSectionHeader、UICollectionElementKindSectionFooter）来获取视图可见的 headerView & footerView
        let XReusableViews = collectionView?.visibleSupplementaryViews(ofKind: UICollectionElementKindSectionHeader)
        print(XReusableViews as Any)
        
        // 通过给定的类型 （UICollectionElementKindSectionHeader、UICollectionElementKindSectionFooter）来获取视图可见的 indexPath
        let indexPaths = collectionView?.indexPathsForVisibleSupplementaryElements(ofKind: UICollectionElementKindSectionHeader)
        print(indexPaths as Any)
        
        // MARK: UICollectionView 的Section 的增加、删除、刷新、移动
        let set = NSIndexSet.init(indexesIn: NSRange.init(location: 0, length: 3))
        //  UICollectionView 的Section 的插入操作
        collectionView?.insertSections(set as IndexSet)
        //  UICollectionView 的Section 的删除操作
        collectionView?.deleteSections(set as IndexSet)
        //  UICollectionView 的Section 的数据刷新操作
        collectionView?.reloadSections(set as IndexSet)
        //  UICollectionView 的Section 移动到另一个新的位置
        collectionView?.moveSection(0, toSection: 3)
        
        // MARK: UICollectionView 的 Item 的增加、删除、刷新、移动
        // UICollectionView 的 Item 的插入操作
        collectionView?.insertItems(at: [IndexPath.init(row: 1, section: 1)])
        // UICollectionView 的 Item 的删除操作
        collectionView?.deselectItem(at: IndexPath.init(row: 0, section: 1), animated: true)
        // UICollectionView 的 Item 的刷新操作
        collectionView?.reloadItems(at: [IndexPath.init(row: 0, section: 1)])
        // UICollectionView 的 Item 的移动操作
        collectionView?.moveItem(at: IndexPath.init(row: 0, section: 1), to: IndexPath.init(row: 0, section: 2))
        // UICollectionView 的Section 或者 Item 的增加、删除、刷新、移动调用的函数
        collectionView?.performBatchUpdates({
            // 要更新的 Layout
        }) { (isFinsh) in
            // 判断是否完成，再做其他事情
        }
        
        // 是否在移动的时候，对 UICollectionView 的 Item 进行排序,返回一个BOOl 值,默认情况是 true
        collectionView?.beginInteractiveMovementForItem(at: IndexPath.init(row: 0, section: 2))
        // 更新 UICollectionView 的 Item 移动时的点（位置）
        collectionView?.updateInteractiveMovementTargetPosition(CGPoint.init(x: 100, y: 30))
        // 移动Item到新的点
        collectionView?.endInteractiveMovement()
        // 将item恢复到原始的点
        collectionView?.cancelInteractiveMovement()
       
    }
    
}
