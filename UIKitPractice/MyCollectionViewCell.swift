//
//  MyCollectionViewCell.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/03/13.
//

import Foundation
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.backgroundColor = .systemGray5
        self.myImage.tintColor = .systemPink

    }
    
}
