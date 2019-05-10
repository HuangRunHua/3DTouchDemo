//
//  TableViewControllerExtension.swift
//  3DTouchDemo
//
//  Created by Joker Hook on 2019/5/10.
//  Copyright © 2019 Joker Hook. All rights reserved.
//

import Foundation
import UIKit

extension TableViewController {
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return blogs.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.index = indexPath
        cell.delegate = self
        cell.titleLabel.text = blogs[indexPath.row].title
        cell.detailLabel.text = blogs[indexPath.row].detail
        cell.firstImage.setImage(blogs[indexPath.row].image, for: .normal)
        //这里是添加判断是否支持3D Touch的代码
        if #available(iOS 9.0, *) {
            if traitCollection.forceTouchCapability == .available {
                //支持3D Touch
                //注册Peek & Pop功能
                registerForPreviewing(with: self, sourceView: cell)
            }
        }
        return cell
    }
    
}
