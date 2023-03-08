//
//  MyView.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/03/06.
//

import UIKit

struct MyViewData {
    let labelStr: String
    let buttonStr: String
}

class MyView: UIView {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var data: MyViewData? {
        didSet {
            label.text = data?.labelStr
            button.setTitle(data?.buttonStr, for: .normal)
        }
    }
    
    // code
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibInit()
    }
    
    // xib(storyboard)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        xibInit()
    }
    
    func xibInit() {
        let xibView = Bundle.main.loadNibNamed("MyView", owner: self, options: nil)?.first as! UIView
        xibView.frame = self.bounds
        xibView.layer.cornerRadius = 15
        
        self.addSubview(xibView)
    }

}
