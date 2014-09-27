//
//  ZBParallaxCell.swift
//  ParallexCellSwift
//
//  Created by Paddy on 27/09/14.
//  Copyright (c) 2014 zabingo. All rights reserved.
//

import UIKit

class ZBParallaxCell: UITableViewCell {

    @IBOutlet weak var mImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func didScroll(tableView: UITableView, superView: UIView)
    {        
        var rectInSuperView: CGRect = tableView.convertRect(self.frame, toView: superView);
        var distanceFromCenter = CGRectGetHeight(superView.frame)/2 - CGRectGetMinY(rectInSuperView);
        var difference = CGRectGetHeight(self.mImageView.frame) - CGRectGetHeight(self.frame);
        var move = (distanceFromCenter / CGRectGetHeight(superView.frame)) * difference;
        
        var imageRect = self.mImageView.frame;
        imageRect.origin.y = -(difference / 2) + move;
        self.mImageView.frame = imageRect;
    }
}
