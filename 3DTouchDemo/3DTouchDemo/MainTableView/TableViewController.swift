//
//  TableViewController.swift
//  3DTouchDemo
//
//  Created by Joker Hook on 2019/5/10.
//  Copyright © 2019 Joker Hook. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, TableViewCellDelegate, UIViewControllerPreviewingDelegate {
    
    /**
      isImagePeekAndPop这个变量用来判断是需要peek图片还是pop，当为true的时候peek图片
      它的值将会决定previewingContext(_ previewingContext:, commit viewControllerToCommit)里面使用show()还是present()
    */
    var isImagePeekAndPop = true
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {

        guard let cell = previewingContext.sourceView as? TableViewCell else {
            return nil
        }
        guard let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
        
        /**
          在这里判断点击了图片的区域还是图片以外的区域，通过计算触摸点的位置(x,y)来判断
          如果 (触摸点所在的x值<=图片起始x值) && (触摸点所在的x值>=图片末尾x值) && (触摸点所在的y值<=图片起始y值) && (触摸点所在的y值>=图片末尾y值)
          那么触摸点就在图片上，此时要peek的是图片而不是cell
        */
        if location.x >= cell.firstImage.frame.origin.x && location.y >= cell.firstImage.frame.origin.y && location.y <= cell.firstImage.frame.origin.y + cell.firstImage.frame.height && location.x <= cell.firstImage.frame.origin.x + cell.firstImage.frame.width {
            guard let showImageDetailViewController = storyboard?.instantiateViewController(withIdentifier: "ShowDetailImageStoryboard") as? detailImageViewController else {
                return nil
            }
            isImagePeekAndPop = true
            showImageDetailViewController.image = blogs[indexPath.row].image
            showImageDetailViewController.preferredContentSize = CGSize(width: 0.0, height: 360.0)
            previewingContext.sourceRect = cell.firstImage.imageView!.frame
            return showImageDetailViewController
        } else {
            guard let showCellDetailViewController = storyboard?.instantiateViewController(withIdentifier: "ShowDetailCellStoryboard") as? detailCellTableViewController else {
                return nil
            }
            isImagePeekAndPop = false
            showCellDetailViewController.blog = blogs[indexPath.row]
            showCellDetailViewController.preferredContentSize = CGSize(width: 0.0, height: 420.0)
            previewingContext.sourceRect = cell.frame
            
            return showCellDetailViewController
        }
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        if isImagePeekAndPop {
            self.present(viewControllerToCommit, animated: true, completion: nil)
        } else {
            show(viewControllerToCommit, sender: self)
        }
    }
    
    
    func showImage(index: Int) {
        /* 注意使用故事面板来实现页面跳转，比较好理解，点击相应cell里的照片后显示出来 */
        let showImage = blogs[index].image
        // cell所在的storyboard
        let destinationStoryboard = UIStoryboard(name:"Main",bundle:nil)
        // 获取照片要传递的storyboard
        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: "ShowDetailImageStoryboard") as! detailImageViewController
        // 设置传递的storyboard里面的照片为showImage
        destinationViewController.image = showImage
        self.present(destinationViewController,animated: true,completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
        tableView.estimatedRowHeight = 450
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
    }
    
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CellDetailSegue" {
            let detailCellViewController = segue.destination as! detailCellTableViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedBlog = blogs[indexPath.row]
            detailCellViewController.blog = selectedBlog
        }
    }

}
