//
//  ViewController.swift
//  Demo-UIPopoverController
//
//  Created by chendehao on 16/8/13.
//  Copyright © 2016年 CDHao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
// MARK: - 点击事件处理
extension ViewController {
    /// 菜单点击
    @IBAction func menuClick(sender: UIBarButtonItem) {
        
        // 由于如果在这里创建, 会导致每点击一次都会创建, 所以定义为慵懒加载属性
        
        // 1.创建内容控制器
        let menuVC = CDH_MenuViewController()
        // 2.创建一个 PopverController, 必须指定内容控制器, 否则会奔溃
        // let menuPopover = UIPopoverController() // 错误写法
        // 3.设置内容控制器(由于改变内容控制器)
        // menuPopover.setContentViewController(menuVC, animated: true)
        
        let menuPopover = UIPopoverController(contentViewController: menuVC)
        
        // 4.设置内容控制器的尺寸 尺寸大小交给展示的控制menuVc器管理,
        // 通过控制器的属性 preferredContentSize 设置
        menuPopover.setPopoverContentSize(CGSizeMake(120, 44 * 3), animated: true)
        
        // 5.弹出 Popover, 并设置弹出位置
        // 在第二个参数 permittedArrowDirections : 直接设置为 Any 让系统自己找到合适的方向, 如果此次自己指定的枚举值也可以,
        // 但是如果自己设置的枚举值不正确, 位置不合适, 则会导致显示结果不正确, 没有小箭头的错误显示
        menuPopover.presentPopoverFromBarButtonItem(sender, permittedArrowDirections: .Any , animated: true)
        
    }
    /// 控制器点击
    @IBAction func controllerClick(sender: UIBarButtonItem) {
    }
    /// 选择颜色点击
    @IBAction func pickColor(sender: UIButton) {
    }
    /// ios8 点击
    @IBAction func iOS8Click(sender: UIButton) {
    }
}
