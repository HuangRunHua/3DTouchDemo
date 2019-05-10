//
//  detailImageViewController.swift
//  3DTouchDemo
//
//  Created by Joker Hook on 2019/5/10.
//  Copyright © 2019 Joker Hook. All rights reserved.
//

import UIKit

class detailImageViewController: UIViewController {

    var image: UIImage?
    /* 轻扫手势返回原先的界面 */
    var swipRecognizer: UISwipeGestureRecognizer!
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            self.imageView.image = image ?? UIImage(named: "")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* 检测向下手势 */
        swipRecognizer.direction = .down
        view.addGestureRecognizer(swipRecognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        swipRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(closeImageView(sender:)))
    }
    
    @objc func closeImageView(sender: UISwipeGestureRecognizer) {
        if sender.direction == .down {
            /* 退回原先界面的核心语句 */
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    /**
     @previewActionItems: [UIPreviewActionItem]
     当用户在3D Touch预览上向上滑动时显示的快速操作
     */
    override var previewActionItems: [UIPreviewActionItem] {
        let sharePreviewAction = UIPreviewAction(title: "Share...", style: .default, handler: {(_, _) in
            guard let image = self.image else { return }
            let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            UIApplication.shared.keyWindow?.rootViewController?.present(activityController, animated: true, completion: nil)
        })
        return [sharePreviewAction]
    }
}
