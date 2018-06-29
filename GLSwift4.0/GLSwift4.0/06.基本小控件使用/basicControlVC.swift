//
//  basicControlVC.swift
//  GLSwift4.0
//
//  Created by gongliang on 2018/3/2.
//  Copyright © 2018年 gongliang. All rights reserved.
//

import UIKit
import SnapKit
class basicControlVC: UIViewController {
    // 一个按钮：button
    let oneButton = UIButton(type: .system)
    //一个label
    let oneLabel = UILabel()
    //一个imageview
    let oneImageView = UIImageView()
    //单行输入文本框
    let oneTextField = UITextField()
    //多行输入框
    let oneTextView = UITextView()
    //一个开关
    let oneSwitch = UISwitch()
    //一个步进器
    let oneStepper = UIStepper()
    //一个滑块
    let oneSlider = UISlider()
    //一个进度条
    let oneProgressView = UIProgressView()
    //一个分段选择器
    var oneSegmentedcontrol = UISegmentedControl()
    //一个选择框
    let onePickerView = UIPickerView()
    var model = mainModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " 基本控件"
        
        view.backgroundColor = UIColor.white
        addbutton()
        addLabel()
        addImageView()
        addTextField()
        addTextView()
        addSwitch()
        addStepper()
        addSlider()
        addProgressView()
        addSegmentedcontrol()
    }
  
    
}
extension basicControlVC:UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    //一个按钮
    /*
     type:
     UIButtonType.system：前面不带图标，默认文字颜色为蓝色，有触摸时的高亮效果
     UIButtonType.custom：定制按钮，前面不带图标，默认文字颜色为白色，无触摸时的高亮效果
     UIButtonType.contactAdd：前面带“+”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
     UIButtonType.detailDisclosure：前面带“!”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
     UIButtonType.infoDark：为感叹号“!”圆形按钮
     UIButtonType.infoLight：为感叹号“!”圆形按钮
     
     Normal          (默认状态)
     Highlighted    （高亮状态）点击按钮不放
     Disabled       （使能状态）就是是否可用状态-->禁用的状态才会显现
     Selected       （选中状态）通过selected属性设置
     
     点击效果：
     touchDown：单点触摸按下事件，点触屏幕
     touchDownRepeat：多点触摸按下事件，点触计数大于1，按下第2、3或第4根手指的时候
     touchDragInside：触摸在控件内拖动时
     touchDragOutside：触摸在控件外拖动时
     touchDragEnter：触摸从控件之外拖动到内部时
     touchDragExit：触摸从控件内部拖动到外部时
     touchUpInside：在控件之内触摸并抬起事件
     touchUpOutside：在控件之外触摸抬起事件
     touchCancel：触摸取消事件，即一次触摸因为放上太多手指而被取消，或者电话打断
     
     禁用button：
     button.isEnabled = false
     button.isEnabled = true
     圆脚：
     button.layer.cornerRadius = 5
     button.layer.masksToBounds = true
     //边框的宽度和颜色
     button.layer.borderWidth = 2
     button.layer.borderColor = UIColor.red.cgColor
     按钮的字体设置为
     UIButton.titleLable?.font = UIFont.system(ofSize:)
     文字颜色
     UIButton.setTitleColor(_ color:UIColor?, for state: UIControlState)
     
     //其它设置
      1. 设置背景图片为圆角
         buttonImage.setImage(UIImage(named:"1") , forState: UIControlState.Normal)
         //设置背景图片为圆角
         buttonImage.imageView?.layer.cornerRadius = 50
         默认情况下按钮会被渲染成单一颜色；系统蓝
         button.setImage(UIImage(named:"icon1"),forState:.Normal)  //设置图标
         button.adjustsImageWhenHighlighted=false //使触摸模式下按钮也不会变暗（半透明）
         button.adjustsImageWhenDisabled=false //使禁用模式下按钮也不会变暗（半透明）
         也可以设置成保留图标原来的颜色
         let iconImage = UIImage(named:"icon2")?.withRenderingMode(.alwaysOriginal)
         button.setImage(iconImage, for:.normal)  //设置图标
         button.adjustsImageWhenHighlighted = false //使触摸模式下按钮也不会变暗（半透明）
         button.adjustsImageWhenDisabled = false //使禁用模式下按钮也不会变暗（半透明）
     
     2.UIButton上图片和文字调整
     UIButton上添加图片和文字，有时需要我们调整
     方向为逆时针方向，上、左、下、右依次去设置的
     btn.imageEdgeInsets =UIEdgeInsetsMake(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat)
     btn.titleEdgeInsets =UIEdgeInsetsMake(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat)
     
   
     */
   func addbutton(){
        oneButton.backgroundColor = UIColor.red
        oneButton.setTitle("我只是一个按钮", for: .normal)
        oneButton.layer.cornerRadius = 25
        oneButton.layer.masksToBounds = true
        oneButton.setTitleColor(UIColor.white, for: .normal)
        oneButton.addTarget( self, action:#selector(buttonTapped(button:)) , for: .touchUpInside)
        view.addSubview(oneButton)
        oneButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(80)
            make.centerX.equalTo(view)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }
    @objc func buttonTapped(button: UIButton){
        print("a button")
        addPickerView()
    }
    
    /*
     设置字体的大小和样式
         label.font = UIFont.init(name: "Thonburi", size: 30)
     */
    func addLabel(){
//        oneLabel.text = "这只是一个文本框，aaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        oneLabel.backgroundColor = UIColor.gray
        oneLabel.textColor = UIColor.white
        oneLabel.font = UIFont.systemFont(ofSize: 15)
        //对齐方式
        oneLabel.textAlignment = NSTextAlignment.center
        //阴影 - 颜色和偏移
//        oneLabel.shadowColor = UIColor.gray
//        oneLabel.shadowOffset = CGSize.init(width: 3, height: 4)
        //内容显示限制
        /*
         byTruncatingTail  //隐藏尾部并显示省略号
         byTruncatingMiddle  //隐藏中间部分并显示省略号
         byTruncatingHead  //隐藏头部并显示省略号
         byClipping  //截去多余部分也不显示省略号
         */
         oneLabel.lineBreakMode = .byTruncatingTail
         oneLabel.numberOfLines = 2
         //设置文本高亮
         oneLabel.isHighlighted = true
        
        //富文本设置
        let attributeString = NSMutableAttributedString.init(string: "welcome to Swift 我是车神")
        //从文本0开始6个字符字体HelveticaNeue-Bold,16号
        attributeString.addAttribute(NSAttributedStringKey.font, value: UIFont.init(name: "HelveticaNeue-Bold", size: 23) ?? UIFont.boldSystemFont(ofSize: 23), range: NSRange.init(location: 0, length: 6))
        //设置富文本字体颜色
        attributeString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.brown, range: NSMakeRange(0, 6))
        //设置文字背景颜色
        attributeString.addAttribute(NSAttributedStringKey.backgroundColor, value: UIColor.red, range: NSMakeRange(6, 5))
        oneLabel.attributedText = attributeString
        
         view.addSubview(oneLabel)
         oneLabel.snp.makeConstraints { (make) in
            make.top.equalTo(oneButton.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.width.equalTo(150)
            make.height.equalTo(100)
         }
    }
    /*
     来获取文件目录中的资源文件，例如：
     
         let path = Bundle.main.path(forResource: "doge", ofType: "jpg")
         let newImage = UIImage(contentsOfFile: path!)
         imageView.image = newImage
     
         //加载网络图片(因为没有网络访问权限导致图片链接加载失败，在info.plist文件中添加网络访问权限)
                let imageDemo = UIImage.init(data: <#T##Data#>)
                oneImageView.contentMode =  设置展示效果
         ////设置图片数组
         imageView.animationImages = [UIImage(named:"user1")!,UIImage(named:"user3")!]
         //设置每隔2秒变化一次
         imageView.animationDuration=2
     
         override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         imageView.startAnimating()
         }
     
         override func viewWillDisappear(_ animated: Bool) {
         super.viewWillAppear(animated)
         imageView.stopAnimating()
         }

     */
    func addImageView(){
        let imageDemo = UIImage.init(named: "imageDemo")
        oneImageView.image = imageDemo
        view.addSubview(oneImageView)
        oneImageView.snp.makeConstraints { (make) in
            make.top.equalTo(oneLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.width.height.equalTo(50)
        }
    }
    /*
        1.TextField边框样式，默认无边框
         UITextBorderStyle.none：无边框
         UITextBorderStyle.line：直线边框
         UITextBorderStyle.roundedRect：圆角矩形边框
         UITextBorderStyle.bezel：边线+阴影
         2.设置边框颜色、线宽、圆角半径
         //需现将masksToBounds设置为true
         textField.layer.masksToBounds = true
         textField.layer.borderColor = UIColor.blue.cgColor
         textField.layer.borderWidth = 2.0
         textField.layer.cornerRadius = 5.0
         3.文本框提示文字以及属性设置
          textField.placeholder = "这是提示文本"//提示文本
         //当文字超出文本框宽度时，自动调整文字大小，默认是以省略号代替
         textField.adjustsFontSizeToFitWidth  = true
         textField.minimumFontSize=10  //最小可缩小的字号
         4.设置水平/垂直对齐方式
         水平对齐
         textField.textAlignment = .right //水平右对齐
         textField.textAlignment = .center //水平居中对齐
         textField.textAlignment = .left //水平左对齐
     
         /** 垂直对齐 **/
         textField.contentVerticalAlignment = .top  //垂直向上对齐
         textField.contentVerticalAlignment = .center  //垂直居中对齐
         textField.contentVerticalAlignment = .bottom  //垂直向下对齐
         5.设置背景图片
     
         textField.borderStyle = .none //先要去除边框样式
         textField.background = UIImage(named:"bgImg");
         6.设置清除按钮
     
         textField.clearButtonMode = .whileEditing  //编辑时出现清除按钮
         textField.clearButtonMode = .unlessEditing  //编辑时不出现，编辑后才出现清除按钮
         textField.clearButtonMode = .always  //一直显示清除按钮
         7.设置键盘输入类型
     
         Default：系统默认的虚拟键盘
         ASCII Capable：显示英文字母的虚拟键盘
         Numbers and Punctuation：显示数字和标点的虚拟键盘
         URL：显示便于输入url网址的虚拟键盘
         Number Pad：显示便于输入数字的虚拟键盘
         Phone Pad：显示便于拨号呼叫的虚拟键盘
         Name Phone Pad：显示便于聊天拨号的虚拟键盘
         Email Address：显示便于输入Email的虚拟键盘
         Decimal Pad：显示用于输入数字和小数点的虚拟键盘
         Twitter：显示方便些Twitter的虚拟键盘
         Web Search：显示便于在网页上书写的虚拟键盘
         textField.becomeFirstResponder()//获取输入焦点，并弹出键盘
         //textField.resignFirstResponder()//失去焦点，并收起键盘
         textField.keyboardType = .numberPad//设置键盘输入模式
         8.设置键盘上return键的样式
     
         done //表示完成输入
         go //表示完成输入，同时会跳到另一页
         search //表示搜索
         join //表示注册用户或添加数据
         next //表示继续下一步
         send //表示发送
         textField.returnKeyType = UIReturnKeyType.done //表示完成输入
         textField.returnKeyType = UIReturnKeyType.go //表示完成输入，同时会跳到另一页
         textField.returnKeyType = UIReturnKeyType.search //表示搜索
         textField.returnKeyType = UIReturnKeyType.join //表示注册用户或添加数据
         textField.returnKeyType = UIReturnKeyType.next //表示继续下一步
         textField.returnKeyType = UIReturnKeyType.send //表示发送

     */
    func addTextField(){
        oneTextField.borderStyle = .roundedRect
        oneTextField.layer.masksToBounds = true
        oneTextField.layer.borderWidth = 1
        oneTextField.layer.cornerRadius = 5
        oneTextField.layer.borderColor = UIColor.black.cgColor
        oneTextField.placeholder = "这是一个单行输入框"
        oneTextField.keyboardType = .asciiCapable
        oneTextField.returnKeyType = .done
        oneTextField.delegate = self
        view.addSubview(oneTextField)
        oneTextField.snp.makeConstraints { (make) in
            make.top.equalTo(oneImageView.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
//        oneTextField.becomeFirstResponder()//获取输入焦点，并弹出键盘
    }
    //textField delegate
    //
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("开始编辑\(textField.text!)")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("结束编辑\(textField.text!)")
    }
//    @available(iOS 10.0, *)
//    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
//
//    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("正在编辑\(textField.text!)")
        return true
    }
    //按键盘return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.text!)
        oneTextField.resignFirstResponder()//失去焦点，并收起键盘
        return true
    }
    /*
     1.文本加入
     textView.dataDetectorTypes = [] //都不加链接
     textView.dataDetectorTypes = UIDataDetectorTypes.phoneNumber //只有电话加链接
     textView.dataDetectorTypes = UIDataDetectorTypes.link //只有网址加链接
     textView.dataDetectorTypes = UIDataDetectorTypes.all //电话和网址都加
     2.
  
     */
    func addTextView(){
        oneTextView.layer.masksToBounds = true
        oneTextView.layer.borderWidth = 1
        oneTextView.layer.cornerRadius = 5
        oneTextView.layer.borderColor = UIColor.red.cgColor
        oneTextView.textAlignment = .center
        oneTextView.textColor = UIColor.black
        oneTextView.isEditable = false // 是否可编辑
        oneTextView.isSelectable = true //是否内容可选择（复制）
        oneTextView.font = UIFont.systemFont(ofSize: 15)
        oneTextView.dataDetectorTypes = .all
        oneTextView.text = "phone:18684795515,\n link:https://www.baidu.com"//设置文本内容
//        oneTextView.delegate = self
        view.addSubview(oneTextView)
        oneTextView.snp.makeConstraints { (make) in
            make.top.equalTo(oneTextField.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
    }
    //textView delegate  和 textField  一样
    
    
    func addSwitch(){
        //设置开启状态显示的颜色
        oneSwitch.onTintColor = UIColor.blue
        //设置边框的颜色
        oneSwitch.tintColor = UIColor.gray
        //滑块上小圆点的颜色
        oneSwitch.thumbTintColor = UIColor.white
        //设置初始状态
        oneSwitch.isOn = false
        //添加状态变化监听器
        oneSwitch.addTarget(self, action: #selector(switchDidChange(sw:)), for: .valueChanged)
        view.addSubview(oneSwitch)
        oneSwitch.snp.makeConstraints { (make) in
            make.top.equalTo(oneLabel.snp.top)
            make.leading.equalTo(oneLabel.snp.trailing).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
    }
    @objc func switchDidChange(sw:UISwitch){
        print(sw.isOn)
    }
    /*
     1.修改默认图片
       stepper.setDecrementImage(UIImage(named:"voice-"), for: .normal)
       stepper.setIncrementImage(UIImage(named:"voice+"), for: .normal)
     */
    func addStepper(){
        //设置stepper的范围和初始值
        oneStepper.maximumValue = 10
        oneStepper.minimumValue = 1
        //初始数
        oneStepper.value = 3
        //设置步长
        oneStepper.stepValue = 1
        //是否可以按住不放连续更改值
        oneStepper.isContinuous = true
        //设置stepper是否循环
        oneStepper.wraps = true
        oneStepper.addTarget(self, action: #selector(oneStepperSelector(oneSpp:)), for: .valueChanged)
        view.addSubview(oneStepper)
        oneStepper.snp.makeConstraints { (make) in
            make.top.equalTo(oneSwitch.snp.bottom).offset(20)
            make.leading.equalTo(oneSwitch.snp.leading)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
    }
    @objc func oneStepperSelector(oneSpp:UIStepper){
        print(oneSpp.value)
    }
    
    /*
     1.滑块两边进度颜色
     slider.minimumTrackTintColor = UIColor.red //左边槽的颜色
     slider.maximumTrackTintColor = UIColor.green //右边槽的颜色
     2.设置进度槽两侧图标
     slider.minimumValueImage = UIImage(named:"voice-")  //左边图标
     slider.maximumValueImage = UIImage(named:"voice+")  //右边图标
     3.设置滑块图标
     slider.setThumbImage(UIImage(named:"voice"), for: .normal)//设置滑块图片
     */
    func addSlider(){
        //初始属性
        oneSlider.minimumValue = 1
        oneSlider.maximumValue = 10
        oneSlider.value = 5
        oneSlider.setValue(1, animated: true)
        oneSlider.addTarget(self, action: #selector(oneSliderSelector(oneSd:)), for: .valueChanged)
        view.addSubview(oneSlider)
        oneSlider.snp.makeConstraints { (make) in
            make.top.equalTo(oneTextView.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
    }
    @objc func oneSliderSelector(oneSd:UISlider){
         print(oneSd.value)
    }
    
    /*
     
     */
    func addProgressView(){
        oneProgressView.progressViewStyle = .default
        oneProgressView.setProgress(0.5, animated: true)
        oneProgressView.progressTintColor = UIColor.black
        oneProgressView.trackTintColor = UIColor.white
        oneProgressView.layer.borderWidth = 1
        oneProgressView.layer.borderColor = UIColor.gray.cgColor
        //改变进度条的高度(宽度不变，高度为默认的1倍) --可以不用，用了之后会变为设置宽高的倍数
//        oneProgressView.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
        view.addSubview(oneProgressView)
        oneProgressView.snp.makeConstraints { (make) in
            make.top.equalTo(oneSlider.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(10)
        }
        
    }
    /*
         // 设置选中为 3 的下标
         oneSegmentedcontrol("点击喽", forSegmentAt: 2)
         // 设置下标为 0 的图片
         oneSegmentedcontrol(UIImage.init(named: "1.png"), forSegmentAt: 0)
         // 在某个下标内插入文字
         segment.insertSegment(withTitle: "我来了", at: 2, animated: true)
         // 在某个下标内插入图片
         segment.insertSegment(with: UIImage.init(named: "1.png"), at: 2, animated: true)
         // 移除某个下标下的元素
         segment.removeSegment(at: 1, animated: true)
         // 移除全部元素
         segment.removeAllSegments()
    
     */
    func addSegmentedcontrol(){
        let array = ["我","你","她"]
        oneSegmentedcontrol = UISegmentedControl.init(items: array)
        //设置边框与文字的颜色
        oneSegmentedcontrol.tintColor = UIColor.red
        // 默认选择
        oneSegmentedcontrol.selectedSegmentIndex = 1
        //设置选中和未选中字体的颜色
        oneSegmentedcontrol.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.black], for: .normal)
        oneSegmentedcontrol.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.white], for: .selected)
        oneSegmentedcontrol.addTarget(self, action: #selector(oneSegmentedcontrolWithSelector(oneSegmented:)), for: .valueChanged)
        view.addSubview(oneSegmentedcontrol)
        oneSegmentedcontrol.snp.makeConstraints { (make) in
            make.top.equalTo(oneProgressView.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }
   @objc func oneSegmentedcontrolWithSelector(oneSegmented:UISegmentedControl){
        print("点击了第几个\(oneSegmented.selectedSegmentIndex)")
    }
    
    /*
     
     */
    func addPickerView(){
        onePickerView.dataSource = self
        onePickerView.delegate = self
        //设置选择框的默认值
        onePickerView.selectRow(1, inComponent: 0, animated: true)
        view.addSubview(onePickerView)
        onePickerView.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalTo(view)
            make.height.equalTo(200)
        }
        
    }
    //几列
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //几行
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return model.pickerArray.count
    }
    //内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return model.pickerArray![row] as? String
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
}
