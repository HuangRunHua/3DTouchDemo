//
//  TableViewCell.swift
//  3DTouchDemo
//
//  Created by Joker Hook on 2019/5/10.
//  Copyright © 2019 Joker Hook. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var delegate: TableViewCellDelegate?
    var index: IndexPath?
    /**
      在这里使用四个按钮来储存照片，方便到时候查看照片
     */
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var firstImage: UIButton! {
        didSet {
            self.firstImage.layer.cornerRadius = 15.0
            self.firstImage.layer.masksToBounds = true
            self.firstImage.imageView?.contentMode = .scaleAspectFill
            self.firstImage.imageView?.clipsToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func showImageButtonTapped(_ sender: UIButton) {
        delegate?.showImage(index: index!.row)
    }
    
}

@objc protocol TableViewCellDelegate: class {
    func showImage(index: Int)
}
