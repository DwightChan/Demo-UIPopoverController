//
//  CDH_OneViewController.swift
//  Demo-UIPopoverController
//
//  Created by chendehao on 16/8/13.
//  Copyright © 2016年 CDHao. All rights reserved.
//

import UIKit

class CDH_OneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置导航栏的标题
        title = "第一个控制器"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem:  .Camera, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Bookmarks, target: nil, action: nil)
        
        // 创建按钮
        let nextBtn = UIButton()
        nextBtn.setTitle("第二个控制器", forState: .Normal)
        nextBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        nextBtn.frame = CGRectMake(50, 50, 200, 40)
        view.addSubview(nextBtn)
        
        nextBtn.addTarget(self, action: #selector(CDH_OneViewController.nextClick), forControlEvents: .TouchUpInside)
        
        // 设置返回按钮的样式
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "返回", style: .Plain, target: nil, action: nil)
    }
    func nextClick() -> Void {
        // push 出第二个控制器
        navigationController?.pushViewController(CDH_TwoViewController(), animated: true)
    }
}




