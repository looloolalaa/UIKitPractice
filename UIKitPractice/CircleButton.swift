//
//  CircleButton.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/03/09.
//

import Foundation
import UIKit

@IBDesignable
class CircleButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = false
        }
    }
    
}
