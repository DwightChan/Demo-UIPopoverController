//
//  CDH_PickColorViewController.swift
//  Demo-UIPopoverController
//
//  Created by chendehao on 16/8/13.
//  Copyright © 2016年 CDHao. All rights reserved.
//

import UIKit

class CDH_PickColorViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 根据图片的尺寸设置控制器的尺寸
        preferredContentSize = imageView.image!.size
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 1.获取点击的点, 转为颜色
        let point = touches.first?.locationInView(imageView)
        
        // 2.将点击的点转为颜色
//        let color = imageView
        
        
    }
}
