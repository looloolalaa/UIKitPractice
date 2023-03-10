//
//  TableViewCell.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/03/10.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.userProfileImage.layer.cornerRadius = self.userProfileImage.frame.width / 2
    }
}
