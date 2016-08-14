//
//  ViewController.swift
//  Demo-UIPopoverController
//
//  Created by chendehao on 16/8/13.
//  Copyright © 2016年 CDHao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 懒加载属性用于 ios7 . ios8  之前的 Popover 的使用 , 
    // 在 ios9 之后就开始弃用, 所以这里会报警, 如果想不让程序报警, 将应用适配版本设置为 8.0系统
    lazy var menuPopover : UIPopoverController = {
        // 创建内容控制器
        let menuVC = CDH_MenuViewController()
        // 1.创建 PopoverController ,必须制定内容控制器, 否则会出现运行时奔溃
        let menuPopover = UIPopoverController(contentViewController: menuVC)
        // 2.设置 popover 的背景颜色
        menuPopover.backgroundColor = UIColor.blueColor()
        return menuPopover
    }()
    lazy var controllerPopover : UIPopoverController = {
        let oneVC = CDH_OneViewController()
        let oneNav = UINavigationController(rootViewController: oneVC)
        
        // 1.创建一个 popoverController , 必须指定内容控制器, 否则会奔溃
        let controllerPopver = UIPopoverController(contentViewController: oneNav)
        // 2.设置背景色
        controllerPopver.backgroundColor = UIColor.greenColor()
        return controllerPopver
    }()
    lazy var colorPopover : UIPopoverController = {
        // 1.创建一个内容控制器
        let colorVC = CDH_PickColorViewController()
        // 2.设置 popoverController, 必须指定内容控制器否者会奔溃
        let colorPopver = UIPopoverController(contentViewController: colorVC)
        // 3.封装 block, 用于改变控制的背景颜色
        // 注意: 循环引用
        colorVC.colorBlock = { [weak self](color : UIColor) -> () in
            self!.view.backgroundColor = color
            // 修原色之后dismiss 掉 modal 出来的控制器
            colorPopver.dismissPopoverAnimated(true)
        }
        return colorPopver
    }()
    
    // 在 ios8/9 之后的是使用都是都下面这个方法
    lazy var iOS8VC : CDH_iOS8ViewController = {
        // 1.创建内容控制器
        let iOS8VC = CDH_iOS8ViewController()
        
        // 2.设置弹出样式为Popover(一旦设置弹出样式为popover,那么popoverPresentationController属性就有值了)
        iOS8VC.modalPresentationStyle = .Popover
        
        // 3.设置弹出位置
        // 注意: 弹出控制的两个属性 sourceView 和 sourceRect 每一次弹出的时候都要设置一次,
        // 所以就不能再懒加载中设置, 而是设置在每次弹出的时候设置
        // testVC.popoverPresentationController?.sourceView = self.view
        // testVC.popoverPresentationController?.sourceRect = self.ios8Btn.frame
        return iOS8VC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
// MARK: - 点击事件处理
extension ViewController {
    /// 菜单点击
    @IBAction func menuClick(sender: UIBarButtonItem) {
        
        // 由于如果在这里创建, 会导致每点击一次都会创建, 所以定义为慵懒加载属性
        
        // 1.创建内容控制器
        // let menuVC = CDH_MenuViewController()
        
        // 2.创建一个 PopverController, 必须指定内容控制器, 否则会奔溃
        // let menuPopover = UIPopoverController() // 错误写法
        // 3.设置内容控制器(由于改变内容控制器)
        // menuPopover.setContentViewController(menuVC, animated: true)
        
        // let menuPopover = UIPopoverController(contentViewController: menuVC)
        
        // 4.设置内容控制器的尺寸 尺寸大小交给展示的控制menuVc器管理,
        // 通过控制器的属性 preferredContentSize 设置
        // menuPopover.setPopoverContentSize(CGSizeMake(120, 44 * 3), animated: true)
        
        // 5.弹出 Popover, 并设置弹出位置
        // 在第二个参数 permittedArrowDirections : 直接设置为 Any 让系统自己找到合适的方向, 如果此次自己指定的枚举值也可以,
        // 但是如果自己设置的枚举值不正确, 位置不合适, 则会导致显示结果不正确, 没有小箭头的错误显示
        menuPopover.presentPopoverFromBarButtonItem(sender, permittedArrowDirections: .Any , animated: true)
        
    }
    /// 控制器点击
    @IBAction func controllerClick(sender: UIBarButtonItem) {
        controllerPopover.presentPopoverFromBarButtonItem(sender, permittedArrowDirections: .Any, animated: true)
    }
    /// 选择颜色点击
    @IBAction func pickColor(sender: UIButton) {
        colorPopover.presentPopoverFromRect(sender.bounds, inView: sender, permittedArrowDirections: .Any, animated: true)
    }
    /// ios8 点击
    @IBAction func iOS8Click(sender: UIButton) {
        // 当 popover消失的时候, 会将内容控制器的 popoverPresentationController属性中的所有属性都清空
        print(iOS8VC.popoverPresentationController?.sourceView)
        
        // 1.设置 popover 的背景颜色
        iOS8VC.popoverPresentationController?.backgroundColor = UIColor.redColor()
        
        // 2.设置弹出的位置
        // 注意: 弹出控制器的两个属性 sourceView 和 sourceRect 每次弹出的时候都要设置
        iOS8VC.popoverPresentationController?.sourceView = self.view
        iOS8VC.popoverPresentationController?.sourceRect = sender.frame
        
        // 3.弹出 popover控制器
        presentViewController(iOS8VC, animated: true, completion: nil)
        
    }
}
