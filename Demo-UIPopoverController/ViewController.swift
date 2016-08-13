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
//        let menuV = 
        
//        let menuPopover = UIPopoverController(contentViewController: )
        
        
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
