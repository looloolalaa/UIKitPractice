//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/01/06.
//

import UIKit

class FirstViewController: UIViewController {
//    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        textView.isScrollEnabled = false
        
        let label = UILabel()
        label.frame = CGRect(x: textView.frame.minX, y: textView.frame.maxY + 100, width: 50, height: 100)
        label.text = "asd"
        self.view.addSubview(label)
        
    }
}

extension FirstViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        textView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)

    }
}
