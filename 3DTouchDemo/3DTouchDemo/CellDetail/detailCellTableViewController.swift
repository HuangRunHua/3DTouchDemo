//
//  detailCellTableViewController.swift
//  3DTouchDemo
//
//  Created by Joker Hook on 2019/5/10.
//  Copyright © 2019 Joker Hook. All rights reserved.
//

import UIKit

class detailCellTableViewController: UITableViewController {

    var blog:Blog?
    
    // 假设titleLabel只有一行
    @IBOutlet weak var titleLabel: UILabel!
    // detaillabel可以有多行
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            self.imageView.layer.cornerRadius = 15.0
            self.imageView.layer.masksToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let blog = blog {
            detailLabel.text = blog.detail
            titleLabel.text = blog.title
            imageView.image = blog.image
        }
    }
    
    
    /**
      动态计算TableViewCell的高度
      由于此时是static cell因此需要使用heightForRowAt来返回对应的cell的高度
     */
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 动态计算detailLabel的方法，根据detailLabel里面的字符计算detailLabel的高度
        if indexPath == [0,0] {
            let size = (detailLabel.text! as NSString).boundingRect(with: CGSize(width: self.imageView.frame.width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)], context: nil)
            return titleLabel.frame.height + imageView.frame.height + size.height + 32
        } else {
            return 44
        }
    }
    
    /**
     @previewActionItems: [UIPreviewActionItem]
     当用户在3D Touch预览上向上滑动时显示的快速操作
     */
    override var previewActionItems: [UIPreviewActionItem] {
        let action1 = UIPreviewAction(title: "测试1", style: .default) { (_, _) in
            // 在这里做你觉得对的事
        }
        let action2 = UIPreviewAction(title: "测试2", style: .default) { (_, _) in
            // 在这里做你觉得对的事
        }
        
        let action3 = UIPreviewAction(title: "取消", style: .destructive) { (_, _) in
            // 在这里做你觉得对的事
        }
        
        ////该按钮可以是一个组，点击该组时，跳到组里面的按钮。
        let subAction1 = UIPreviewAction(title: "1", style: .selected) { (_, _) in
            // 在这里做你觉得对的事
        }
        let subAction2 = UIPreviewAction(title: "2", style: .selected) { (_, _) in
            // 在这里做你觉得对的事
        }
        let subAction3 = UIPreviewAction(title: "3", style: .selected) { (_, _) in
            // 在这里做你觉得对的事
        }
        let groupAction = UIPreviewActionGroup(title: "更多", style: .default, actions: [subAction1, subAction2, subAction3])
        
        return [action1,action2, groupAction, action3]
    }

}
