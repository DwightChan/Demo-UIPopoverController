//
//  CDH_MenuViewController.swift
//  Demo-UIPopoverController
//
//  Created by chendehao on 16/8/13.
//  Copyright © 2016年 CDHao. All rights reserved.
//

import UIKit

class CDH_MenuViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置内容控制器的尺寸
        preferredContentSize = CGSizeMake(120, 44 * 3)
    }
}

// MARK: - tableViewSource Func
extension CDH_MenuViewController{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ID  = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: ID)
            cell?.backgroundColor = UIColor.yellowColor()
        }
        cell?.textLabel?.text = "cdh_test_112"
        return cell!
    }
}
