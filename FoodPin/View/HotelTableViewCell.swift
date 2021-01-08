//
//  HotelTableViewCell.swift
//  FoodPin
//
//  Created by NDHU_CSIE on 2021/1/7.
//  Copyright © 2021 NDHU_CSIE. All rights reserved.
//

import UIKit

class HotelTableViewCell: UITableViewCell {

        
        @IBOutlet var nameLabel: UILabel!
        @IBOutlet var locationLabel: UILabel!
        @IBOutlet var websiteLabel: UILabel!
        @IBOutlet var thumbnailImageView: UIImageView! {
            didSet {
                thumbnailImageView.layer.cornerRadius = thumbnailImageView.bounds.width / 2
                thumbnailImageView.clipsToBounds = true
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

    }
