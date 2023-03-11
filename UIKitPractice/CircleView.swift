//
//  CircleView.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/03/11.
//

import Foundation
import UIKit

class CircleView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width / 2
    }
    
}
